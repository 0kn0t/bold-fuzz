// SPDX-License-Identifier: GPL-2.0
pragma solidity ^0.8.0;

import {BaseTargetFunctions} from "@chimera/BaseTargetFunctions.sol";
import {BeforeAfter, OpType} from "../BeforeAfter.sol";
import {Properties} from "../Properties.sol";
import {vm} from "@chimera/Hevm.sol";
import "src/BorrowerOperations.sol";

abstract contract BorrowerOperationsTargets is
    BaseTargetFunctions,
    Properties
{
    /// CUSTOM TARGET FUNCTIONS - Add your own target functions here ///


    /// AUTO GENERATED TARGET FUNCTIONS - WARNING: DO NOT DELETE OR MODIFY THIS LINE ///

    function borrowerOperations_addColl(uint256 _troveId, uint256 _collAmount) public updateGhosts asActor {
        borrowerOperations.addColl(_troveId, _collAmount);
    }

    function borrowerOperations_addColl_clamped(uint88 _collAmount) public {
        uint256 collAmount = _collAmount % (collToken.balanceOf(_getActor()) + 1);
        borrowerOperations_addColl(troveId, collAmount);
    }

    function borrowerOperations_adjustTrove(uint256 _troveId, uint256 _collChange, bool _isCollIncrease, uint256 _boldChange, bool _isDebtIncrease, uint256 _maxUpfrontFee) public updateGhostsWithType(OpType.ADJUSTING_TROVE) asActor {
        borrowerOperations.adjustTrove(_troveId, _collChange, _isCollIncrease, _boldChange, _isDebtIncrease, _maxUpfrontFee);
    }

    function borrowerOperations_adjustTrove_clamped(uint88 _collChange, bool _isCollIncrease, uint256 _boldChange, bool _isDebtIncrease) public {
        uint256 collChange;
        if (_isCollIncrease) {
            collChange = _collChange % (collToken.balanceOf(_getActor()) + 1);
        } else {
            collChange = _collChange % (troveManager.getTroveColl(troveId) + 1);
        }
        borrowerOperations_adjustTrove(troveId, collChange, _isCollIncrease, _boldChange, _isDebtIncrease, type(uint256).max);
    }

    function borrowerOperations_adjustTroveInterestRate(uint256 _troveId, uint256 _newAnnualInterestRate, uint256 _upperHint, uint256 _lowerHint, uint256 _maxUpfrontFee) public updateGhostsWithType(OpType.ADJUSTING_IR) asActor {
        borrowerOperations.adjustTroveInterestRate(_troveId, _newAnnualInterestRate, _upperHint, _lowerHint, _maxUpfrontFee);
    }

    function borrowerOperations_adjustTroveInterestRate_clamped(uint256 _newAnnualInterestRate) public {
        borrowerOperations_adjustTroveInterestRate(troveId, _newAnnualInterestRate, 0, 0, type(uint256).max);
    }

    function borrowerOperations_adjustZombieTrove(uint256 _troveId, uint256 _collChange, bool _isCollIncrease, uint256 _boldChange, bool _isDebtIncrease, uint256 _upperHint, uint256 _lowerHint, uint256 _maxUpfrontFee) public updateGhosts asActor {
        borrowerOperations.adjustZombieTrove(_troveId, _collChange, _isCollIncrease, _boldChange, _isDebtIncrease, _upperHint, _lowerHint, _maxUpfrontFee);
    }

    function borrowerOperations_adjustZombieTrove_clamped(uint256 _collChange, bool _isCollIncrease, uint256 _boldChange, bool _isDebtIncrease, uint256 _upperHint, uint256 _lowerHint) public {
        uint256 collChange;
        uint256 boldChange;
        if(_isCollIncrease) {
            collChange = _collChange % (collToken.balanceOf(_getActor()) + 1);
        } else {
            collChange = _collChange % (troveManager.getTroveColl(troveId) + 1);
        }
        if(!_isDebtIncrease) {
            boldChange = _boldChange % (troveManager.getTroveEntireDebt(troveId) + 1);
        }
        borrowerOperations_adjustZombieTrove(troveId, collChange, _isCollIncrease, _boldChange, _isDebtIncrease, _upperHint, _lowerHint, type(uint256).max);
    }

    function borrowerOperations_applyPendingDebt(uint256 _troveId, uint256 _lowerHint, uint256 _upperHint) public updateGhosts asActor {
        borrowerOperations.applyPendingDebt(_troveId, _lowerHint, _upperHint);
    }

    function borrowerOperations_applyPendingDebt_clamped(uint256 _lowerHint, uint256 _upperHint) public {
        borrowerOperations_applyPendingDebt(troveId, _lowerHint, _upperHint);
    }

    function borrowerOperations_claimCollateral() public asActor {
        borrowerOperations.claimCollateral();
    }

    function borrowerOperations_closeTrove(uint256 _troveId) public updateGhostsWithType(OpType.CLOSE) asActor {
        borrowerOperations.closeTrove(_troveId);
    }

    function borrowerOperations_closeTrove_clamped() public {
        borrowerOperations_closeTrove(troveId);
    }

    function borrowerOperations_lowerBatchManagementFee(uint256 _newAnnualManagementFee) public asActor {
        borrowerOperations.lowerBatchManagementFee(_newAnnualManagementFee);
    }

    function borrowerOperations_openTrove(address _owner, uint256 _ownerIndex, uint256 _collAmount, uint256 _boldAmount, uint256 _upperHint, uint256 _lowerHint, uint256 _annualInterestRate, uint256 _maxUpfrontFee, address _addManager, address _removeManager, address _receiver) public updateGhostsWithType(OpType.OPENING) asActor returns (uint256) {
        troveId = borrowerOperations.openTrove(_owner, _ownerIndex, _collAmount, _boldAmount, _upperHint, _lowerHint, _annualInterestRate, _maxUpfrontFee, _addManager, _removeManager, _receiver);
        return troveId;
    }

    function borrowerOperations_openTrove_clamped(uint256 _ownerIndex, uint88 _collAmount, uint88 _boldAmount) public returns (uint256) {
        return borrowerOperations_openTrove(_getActor(), _ownerIndex, _collAmount, _boldAmount, 0, 0, 1e17, type(uint256).max, _getActor(), _getActor(), _getActor());
    }

    function borrowerOperations_openTroveAndJoinInterestBatchManager(IBorrowerOperations.OpenTroveAndJoinInterestBatchManagerParams memory _params) public updateGhostsWithType(OpType.OPENING) asActor returns (uint256) {
        troveId = borrowerOperations.openTroveAndJoinInterestBatchManager(_params);
        return troveId;
    }

    function borrowerOperations_openTroveAndJoinInterestBatchManager_clamped(uint256 _ownerIndex, uint88 _collAmount) public {
        IBorrowerOperations.OpenTroveAndJoinInterestBatchManagerParams memory _params;
        _params.owner = _getActor();
        _params.ownerIndex = _ownerIndex;
        _params.collAmount = _collAmount;
        _params.boldAmount = 2000e18;
        _params.upperHint = 0;
        _params.lowerHint = 0;
        _params.interestBatchManager = batchManager;
        _params.maxUpfrontFee = 1e19;
        _params.addManager = _getActor();
        _params.removeManager = _getActor();
        _params.receiver = _getActor();
        borrowerOperations_openTroveAndJoinInterestBatchManager(_params);
    }

    function borrowerOperations_registerBatchManager(uint128 _minInterestRate, uint128 _maxInterestRate, uint128 _currentInterestRate, uint128 _annualManagementFee, uint128 _minInterestRateChangePeriod) public asActor {
        borrowerOperations.registerBatchManager(_minInterestRate, _maxInterestRate, _currentInterestRate, _annualManagementFee, _minInterestRateChangePeriod);
    }

    function borrowerOperations_registerBatchManager_clamped() public returns (address) {
        borrowerOperations_registerBatchManager(1e16, 1e18 - 100, 1e17, 1e17, 1 hours);
        batchManager = _getActor();
        return batchManager;
    }

    function borrowerOperations_removeFromBatch(uint256 _troveId, uint256 _newAnnualInterestRate, uint256 _upperHint, uint256 _lowerHint, uint256 _maxUpfrontFee) public updateGhosts asActor {
        borrowerOperations.removeFromBatch(_troveId, _newAnnualInterestRate, _upperHint, _lowerHint, _maxUpfrontFee);
    }

    function borrowerOperations_removeFromBatch_clamped(uint256 _newAnnualInterestRate) public {
        borrowerOperations_removeFromBatch(troveId, _newAnnualInterestRate, 0, 0, type(uint256).max);
    }

    function borrowerOperations_removeInterestIndividualDelegate(uint256 _troveId) public updateGhosts asActor {
        borrowerOperations.removeInterestIndividualDelegate(_troveId);
    }

    function borrowerOperations_removeInterestIndividualDelegate_clamped() public {
        borrowerOperations_removeInterestIndividualDelegate(troveId);
    }

    function borrowerOperations_repayBold(uint256 _troveId, uint256 _boldAmount) public updateGhostsWithType(OpType.REPAY) asActor {
        borrowerOperations.repayBold(_troveId, _boldAmount);
    }

    function borrowerOperations_repayBold_clamped(uint256 _boldAmount) public {
        _boldAmount = _boldAmount %  (troveManager.getTroveEntireDebt(troveId) + 1);
        borrowerOperations_repayBold(troveId, _boldAmount);
    }

    function borrowerOperations_setAddManager(uint256 _troveId, address _manager) public asActor {
        borrowerOperations.setAddManager(_troveId, _manager);
    }

    function borrowerOperations_setBatchManagerAnnualInterestRate(uint128 _newAnnualInterestRate, uint256 _upperHint, uint256 _lowerHint, uint256 _maxUpfrontFee) public asActor {
        borrowerOperations.setBatchManagerAnnualInterestRate(_newAnnualInterestRate, _upperHint, _lowerHint, _maxUpfrontFee);
    }

    function borrowerOperations_setInterestBatchManager(uint256 _troveId, address _newBatchManager, uint256 _upperHint, uint256 _lowerHint, uint256 _maxUpfrontFee) public asActor {
        borrowerOperations.setInterestBatchManager(_troveId, _newBatchManager, _upperHint, _lowerHint, _maxUpfrontFee);
    }

    function borrowerOperations_setInterestBatchManager_clamped() public asActor {
        borrowerOperations.setInterestBatchManager(troveId, batchManager, 0, 0, type(uint256).max);
    }

    function borrowerOperations_setInterestIndividualDelegate(uint256 _troveId, address _delegate, uint128 _minInterestRate, uint128 _maxInterestRate, uint256 _newAnnualInterestRate, uint256 _upperHint, uint256 _lowerHint, uint256 _maxUpfrontFee, uint256 _minInterestRateChangePeriod) public asActor {
        borrowerOperations.setInterestIndividualDelegate(_troveId, _delegate, _minInterestRate, _maxInterestRate, _newAnnualInterestRate, _upperHint, _lowerHint, _maxUpfrontFee, _minInterestRateChangePeriod);
    }

    function borrowerOperations_setInterestIndividualDelegate_clamped(address _delegate, uint128 _minInterestRate, uint128 _maxInterestRate, uint256 _newAnnualInterestRate, uint256 _minInterestRateChangePeriod) public {
        borrowerOperations_setInterestIndividualDelegate(troveId, _delegate, _minInterestRate, _maxInterestRate, _newAnnualInterestRate, 0, 0, type(uint256).max, _minInterestRateChangePeriod);
    }

    function borrowerOperations_setRemoveManager(uint256 _troveId, address _manager) public updateGhosts asActor {
        borrowerOperations.setRemoveManager(_troveId, _manager);
    }

    function borrowerOperations_setRemoveManager_clamped() public {
        borrowerOperations_setRemoveManager(troveId, batchManager);
    }

    function borrowerOperations_setRemoveManagerWithReceiver(uint256 _troveId, address _manager, address _receiver) public asActor {
        borrowerOperations.setRemoveManagerWithReceiver(_troveId, _manager, _receiver);
    }

    function borrowerOperations_shutdown() public asActor {
        borrowerOperations.shutdown();
    }

    function borrowerOperations_switchBatchManager(uint256 _troveId, uint256 _removeUpperHint, uint256 _removeLowerHint, address _newBatchManager, uint256 _addUpperHint, uint256 _addLowerHint, uint256 _maxUpfrontFee) public updateGhosts asActor {
        borrowerOperations.switchBatchManager(_troveId, _removeUpperHint, _removeLowerHint, _newBatchManager, _addUpperHint, _addLowerHint, _maxUpfrontFee);
    }

    function borrowerOperations_switchBatchManager_clamped() public {
        borrowerOperations_switchBatchManager(troveId, 0, 0, batchManager, 0, 0, type(uint256).max);
    }

    function borrowerOperations_withdrawBold(uint256 _troveId, uint256 _boldAmount, uint256 _maxUpfrontFee) public updateGhosts asActor {
        borrowerOperations.withdrawBold(_troveId, _boldAmount, _maxUpfrontFee);
    }

    function borrowerOperations_withdrawBold_clamped(uint88 _boldAmount) public {
        borrowerOperations_withdrawBold(troveId, _boldAmount, type(uint256).max);
    }

    function borrowerOperations_withdrawColl(uint256 _troveId, uint256 _collWithdrawal) public updateGhosts asActor {
        borrowerOperations.withdrawColl(_troveId, _collWithdrawal);
    }

    function borrowerOperations_withdrawColl_clamped(uint256 _collWithdrawal) public {
        _collWithdrawal = _collWithdrawal%  (troveManager.getTroveColl(troveId) + 1);
        borrowerOperations.withdrawColl(troveId, _collWithdrawal);
    }
}