// SPDX-License-Identifier: GPL-2.0
pragma solidity ^0.8.0;

import {BaseTargetFunctions} from "@chimera/BaseTargetFunctions.sol";
import {BeforeAfter} from "../BeforeAfter.sol";
import {Properties} from "../Properties.sol";
import {vm} from "@chimera/Hevm.sol";
import "src/BorrowerOperations.sol";

abstract contract BorrowerOperationsTargets is
    BaseTargetFunctions,
    Properties
{
    /// CUSTOM TARGET FUNCTIONS - Add your own target functions here ///


    /// AUTO GENERATED TARGET FUNCTIONS ///

    function borrowerOperations_addColl(uint256 _collAmount) public asActor {
        borrowerOperations.addColl(troveId, _collAmount);
    }

    function borrowerOperations_adjustTrove(uint256 _collChange, bool _isCollIncrease, uint256 _boldChange, bool _isDebtIncrease, uint256 _maxUpfrontFee) public asActor {
        borrowerOperations.adjustTrove(troveId, _collChange, _isCollIncrease, _boldChange, _isDebtIncrease, _maxUpfrontFee);
    }

    function borrowerOperations_adjustTroveInterestRate(uint256 _newAnnualInterestRate, uint256 _upperHint, uint256 _lowerHint, uint256 _maxUpfrontFee) public asActor {
        borrowerOperations.adjustTroveInterestRate(troveId, _newAnnualInterestRate, _upperHint, _lowerHint, _maxUpfrontFee);
    }

    function borrowerOperations_adjustZombieTrove(uint256 _collChange, bool _isCollIncrease, uint256 _boldChange, bool _isDebtIncrease, uint256 _upperHint, uint256 _lowerHint, uint256 _maxUpfrontFee) public asActor {
        borrowerOperations.adjustZombieTrove(troveId, _collChange, _isCollIncrease, _boldChange, _isDebtIncrease, _upperHint, _lowerHint, _maxUpfrontFee);
    }

    function borrowerOperations_applyPendingDebt(uint256 _lowerHint, uint256 _upperHint) public asActor {
        borrowerOperations.applyPendingDebt(troveId, _lowerHint, _upperHint);
    }

    function borrowerOperations_claimCollateral() public asActor {
        borrowerOperations.claimCollateral();
    }

    function borrowerOperations_closeTrove() public asActor {
        borrowerOperations.closeTrove(troveId);
    }

    function borrowerOperations_lowerBatchManagementFee(uint256 _newAnnualManagementFee) public asActor {
        borrowerOperations.lowerBatchManagementFee(_newAnnualManagementFee);
    }

    function borrowerOperations_onLiquidateTrove() public asActor {
        borrowerOperations.onLiquidateTrove(troveId);
    }

    function borrowerOperations_openTrove(uint256 _ownerIndex, uint256 _collAmount, uint256 _boldAmount, uint256 _annualInterestRate) public asActor {
        troveId = borrowerOperations.openTrove(_getActor(), _ownerIndex, _collAmount, _boldAmount, 0, 0, _annualInterestRate, hintHelpers.predictOpenTroveUpfrontFee(0, _boldAmount, _annualInterestRate), _getActor(), _getActor(), _getActor());
    }

    function borrowerOperations_openTroveAndJoinInterestBatchManager(IBorrowerOperations.OpenTroveAndJoinInterestBatchManagerParams memory _params) public asActor {
        borrowerOperations.openTroveAndJoinInterestBatchManager(_params);
    }

    function borrowerOperations_registerBatchManager(uint128 _minInterestRate, uint128 _maxInterestRate, uint128 _currentInterestRate, uint128 _annualManagementFee, uint128 _minInterestRateChangePeriod) public asActor {
        borrowerOperations.registerBatchManager(_minInterestRate, _maxInterestRate, _currentInterestRate, _annualManagementFee, _minInterestRateChangePeriod);
    }

    function borrowerOperations_removeFromBatch(uint256 _newAnnualInterestRate, uint256 _upperHint, uint256 _lowerHint, uint256 _maxUpfrontFee) public asActor {
        borrowerOperations.removeFromBatch(troveId, _newAnnualInterestRate, _upperHint, _lowerHint, _maxUpfrontFee);
    }

    function borrowerOperations_removeInterestIndividualDelegate() public asActor {
        borrowerOperations.removeInterestIndividualDelegate(troveId);
    }

    function borrowerOperations_repayBold(uint256 _boldAmount) public asActor {
        borrowerOperations.repayBold(troveId, _boldAmount);
    }

    function borrowerOperations_setAddManager(address _manager) public asActor {
        borrowerOperations.setAddManager(troveId, _manager);
    }

    function borrowerOperations_setBatchManagerAnnualInterestRate(uint128 _newAnnualInterestRate, uint256 _upperHint, uint256 _lowerHint, uint256 _maxUpfrontFee) public asActor {
        borrowerOperations.setBatchManagerAnnualInterestRate(_newAnnualInterestRate, _upperHint, _lowerHint, _maxUpfrontFee);
    }

    function borrowerOperations_setInterestBatchManager(address _newBatchManager, uint256 _upperHint, uint256 _lowerHint, uint256 _maxUpfrontFee) public asActor {
        borrowerOperations.setInterestBatchManager(troveId, _newBatchManager, _upperHint, _lowerHint, _maxUpfrontFee);
    }

    function borrowerOperations_setInterestIndividualDelegate(address _delegate, uint128 _minInterestRate, uint128 _maxInterestRate, uint256 _newAnnualInterestRate, uint256 _upperHint, uint256 _lowerHint, uint256 _maxUpfrontFee, uint256 _minInterestRateChangePeriod) public asActor {
        borrowerOperations.setInterestIndividualDelegate(troveId, _delegate, _minInterestRate, _maxInterestRate, _newAnnualInterestRate, _upperHint, _lowerHint, _maxUpfrontFee, _minInterestRateChangePeriod);
    }

    function borrowerOperations_setRemoveManager(address _manager) public asActor {
        borrowerOperations.setRemoveManager(troveId, _manager);
    }

    function borrowerOperations_setRemoveManagerWithReceiver(address _manager, address _receiver) public asActor {
        borrowerOperations.setRemoveManagerWithReceiver(troveId, _manager, _receiver);
    }

    function borrowerOperations_shutdown() public asActor {
        borrowerOperations.shutdown();
    }

    function borrowerOperations_shutdownFromOracleFailure() public asActor {
        borrowerOperations.shutdownFromOracleFailure();
    }

    function borrowerOperations_switchBatchManager(uint256 _removeUpperHint, uint256 _removeLowerHint, address _newBatchManager, uint256 _addUpperHint, uint256 _addLowerHint, uint256 _maxUpfrontFee) public asActor {
        borrowerOperations.switchBatchManager(troveId, _removeUpperHint, _removeLowerHint, _newBatchManager, _addUpperHint, _addLowerHint, _maxUpfrontFee);
    }

    function borrowerOperations_withdrawBold(uint256 _boldAmount, uint256 _maxUpfrontFee) public asActor {
        borrowerOperations.withdrawBold(troveId, _boldAmount, _maxUpfrontFee);
    }

    function borrowerOperations_withdrawColl(uint256 _collWithdrawal) public asActor {
        borrowerOperations.withdrawColl(troveId, _collWithdrawal);
    }
}