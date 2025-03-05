// SPDX-License-Identifier: GPL-2.0
pragma solidity ^0.8.0;

import {Asserts} from "@chimera/Asserts.sol";
import {BeforeAfter, OpType} from "./BeforeAfter.sol";
import {LatestTroveData} from "../../src/Types/LatestTroveData.sol";
import {MIN_DEBT} from "../../src/Dependencies/Constants.sol";

abstract contract Properties is BeforeAfter, Asserts {
    function property_critical_mode() public {
        // when TCR ≤ CCR => Disables operations like opening or adjusting Troves but allows debt repayment, interest rate changes, or actions improving the collateral ratio.
        uint256 price = priceFeed.getPrice();
        uint256 TCR = troveManager.getTCR(price);
        uint256 CCR = troveManager.get_CCR();
        if(TCR <= CCR) {
            t(currentOperation != OpType.OPENING && currentOperation != OpType.ADJUSTING_TROVE, "Opening or adjusting Troves should be disabled");
        }
    }

    function property_min_debt() public {
        // Troves must maintain debt ≥ MIN_DEBT (2000 BOLD), except for "zombie" Troves.
        if(borrowerOperations.hasBeenShutDown()) {
            return;
        }
        
        uint256 trove = sortedTroves.getFirst();
        while(trove != 0) {
            uint256 debt = troveManager.getTroveEntireDebt(trove);
            gte(debt, MIN_DEBT, "Debt should be greater than or equal to MIN_DEBT");
            trove = sortedTroves.getNext(trove);
        }
    }

    function property_no_zombie_in_sorted() public {
        // "Zombie" Troves should not be in the sorted list.
        uint256 trove = sortedTroves.getFirst();
        while(trove != 0) {
            t(!troveManager.checkTroveIsZombie(trove), "Zombie Troves should not be in the sorted list");
            trove = sortedTroves.getNext(trove);
        }
    }

    function property_debt_increase() public {
        // Verify that debt increases over time due to interest accrual

        if(currentOperation == OpType.ADJUSTING_TROVE || currentOperation == OpType.ADJUSTING_IR) {
            return;
        }

        uint256 trove = sortedTroves.getFirst();
        while(trove != 0) {
            LatestTroveData memory beforeData = _before.trovesData[trove];
            LatestTroveData memory afterData = _after.trovesData[trove];
            gte(afterData.entireDebt, beforeData.entireDebt, "Debt should not decrease over time");
            trove = sortedTroves.getNext(trove);
        }
    }

    function property_calculated_debts() public {
        // Verify that calculated debts are correct
        eq(_after.calculatedDebts, _after.entireSystemDebt, "Calculated debts should be equal to entire system debt");
    }

    function property_calculated_weighted_debts() public {
        // Verify that calculated weighted debts are correct
        eq(_after.calculatedWeightedDebts, _after.weightedDebts, "Calculated weighted debts SUM(debt * rate) should be equal to SUM(weighted debts)");
    }


}