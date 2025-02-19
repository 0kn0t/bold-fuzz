// SPDX-License-Identifier: GPL-2.0
pragma solidity ^0.8.0;

import {BaseTargetFunctions} from "@chimera/BaseTargetFunctions.sol";
import {BeforeAfter} from "../BeforeAfter.sol";
import {Properties} from "../Properties.sol";
import {vm} from "@chimera/Hevm.sol";
import "src/Zappers/GasCompZapper.sol";

abstract contract GasCompZapperTargets is
    BaseTargetFunctions,
    Properties
{
    /// CUSTOM TARGET FUNCTIONS - Add your own target functions here ///


    /// AUTO GENERATED TARGET FUNCTIONS ///

    function gasCompZapper_addColl(uint256 _troveId, uint256 _amount) public asActor { // _requireSenderIsOwnerOrAddManager
        gasCompZapper.addColl(_troveId, _amount);
    }

    function gasCompZapper_adjustTrove(uint256 _troveId, uint256 _collChange, bool _isCollIncrease, uint256 _boldChange, bool _isDebtIncrease, uint256 _maxUpfrontFee) public asActor {
        gasCompZapper.adjustTrove(_troveId, _collChange, _isCollIncrease, _boldChange, _isDebtIncrease, _maxUpfrontFee);
    }

    function gasCompZapper_adjustZombieTrove(uint256 _troveId, uint256 _collChange, bool _isCollIncrease, uint256 _boldChange, bool _isDebtIncrease, uint256 _upperHint, uint256 _lowerHint, uint256 _maxUpfrontFee) public asActor {
        gasCompZapper.adjustZombieTrove(_troveId, _collChange, _isCollIncrease, _boldChange, _isDebtIncrease, _upperHint, _lowerHint, _maxUpfrontFee);
    }

    function gasCompZapper_closeTroveFromCollateral(uint256 _troveId, uint256 _flashLoanAmount) public asActor { // _requireSenderIsOwnerOrRemoveManagerAndGetReceiver
        gasCompZapper.closeTroveFromCollateral(_troveId, _flashLoanAmount);
    }

    function gasCompZapper_closeTroveToRawETH(uint256 _troveId) public asActor { // _requireSenderIsOwnerOrRemoveManagerAndGetReceiver
        gasCompZapper.closeTroveToRawETH(_troveId);
    }

    function gasCompZapper_openTroveWithRawETH(IZapper.OpenTroveParams memory _params) public payable asActor {
        gasCompZapper.openTroveWithRawETH{value: msg.value}(_params);
    }

//    function gasCompZapper_receiveFlashLoanOnCloseTroveFromCollateral(IZapper.CloseTroveParams memory _params, uint256 _effectiveFlashLoanAmount) public asActor {
//        gasCompZapper.receiveFlashLoanOnCloseTroveFromCollateral(_params, _effectiveFlashLoanAmount);
//    }

    function gasCompZapper_repayBold(uint256 _troveId, uint256 _boldAmount) public asActor { // _requireSenderIsOwnerOrAddManager
        gasCompZapper.repayBold(_troveId, _boldAmount);
    }

    function gasCompZapper_setAddManager(uint256 _troveId, address _manager) public asActor { // _requireCallerIsBorrower
        gasCompZapper.setAddManager(_troveId, _manager);
    }

    function gasCompZapper_setRemoveManager(uint256 _troveId, address _manager) public asActor { // _requireCallerIsBorrower
        gasCompZapper.setRemoveManager(_troveId, _manager);
    }

    function gasCompZapper_setRemoveManagerWithReceiver(uint256 _troveId, address _manager, address _receiver) public asActor { // _requireCallerIsBorrower
        gasCompZapper.setRemoveManagerWithReceiver(_troveId, _manager, _receiver);
    }

    function gasCompZapper_withdrawBold(uint256 _troveId, uint256 _boldAmount, uint256 _maxUpfrontFee) public asActor { // _requireSenderIsOwnerOrRemoveManagerAndGetReceiver
        gasCompZapper.withdrawBold(_troveId, _boldAmount, _maxUpfrontFee);
    }

    function gasCompZapper_withdrawColl(uint256 _troveId, uint256 _amount) public asActor { // _requireSenderIsOwnerOrRemoveManagerAndGetReceiver
        gasCompZapper.withdrawColl(_troveId, _amount);
    }
}