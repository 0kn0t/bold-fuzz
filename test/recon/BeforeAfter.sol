// SPDX-License-Identifier: GPL-2.0
pragma solidity ^0.8.0;

import {Setup} from "./Setup.sol";
import {LiquityMath} from "../../src/Dependencies/LiquityMath.sol";
import {LatestTroveData} from "../../src/Types/LatestTroveData.sol";
import {TroveManager} from "../../src/TroveManager.sol";

enum OpType {
    GENERIC,
    OPENING,
    ADJUSTING_TROVE,
    ADJUSTING_IR,
    REPAY,
    CLOSE
}

// ghost variables for tracking state variable values before and after function calls
abstract contract BeforeAfter is Setup {
    struct Vars {
        mapping(uint256 => LatestTroveData) trovesData;
        mapping(address => TroveManager.Batch) batches;
        uint256 price;
        uint256 collSurplusBalance;
        uint256 entireSystemDebt;
        uint256 calculatedDebts;
        uint256 weightedDebts;
        uint256 calculatedWeightedDebts;
    }

    Vars internal _before;
    Vars internal _after;

    OpType currentOperation;

    modifier updateGhosts() {
        currentOperation = OpType.GENERIC;
        __before();
        _;
        __after();
    }

    modifier updateGhostsWithType(OpType op) {
        currentOperation = op;
        __before();
        _;
        __after();
    }

    function __snapshot(Vars storage vars) internal {
        vars.price = priceFeed.getPrice();
        vars.calculatedDebts = 0; 
        vars.weightedDebts = 0;
        vars.calculatedWeightedDebts = 0;
        for(uint256 i; i < troveManager.getTroveIdsCount(); i++) {
            uint256 _troveId = troveManager.getTroveFromTroveIdsArray(i);
            borrowerOperations.applyPendingDebt(_troveId, 0, 1);
            (uint256 debt, uint256 coll, uint64 arrayIndex, uint64 lastDebtUpdateTime, uint64 lastInterestRateAdjTime, uint256 annualInterestRate, uint256 annualManagementFee, uint256 totalDebtShares) = troveManager.getBatch(_getActor());
            vars.batches[_getActor()] = TroveManager.Batch(
                debt, 
                coll, 
                arrayIndex, 
                lastDebtUpdateTime, 
                lastInterestRateAdjTime, 
                annualInterestRate, 
                annualManagementFee, 
                totalDebtShares
            );
            vars.trovesData[_troveId] = troveManager.getLatestTroveData(_troveId);
            vars.calculatedDebts += vars.trovesData[_troveId].entireDebt;
            vars.weightedDebts += vars.trovesData[_troveId].weightedRecordedDebt;
            vars.calculatedWeightedDebts += vars.trovesData[_troveId].entireDebt * vars.trovesData[_troveId].annualInterestRate;
        }
        // after applying all pending debt
        vars.entireSystemDebt = borrowerOperations.getEntireSystemDebt();
    }

    function __before() internal {
        __snapshot(_before);
    }

    function __after() internal {
        __snapshot(_after);
    }
}