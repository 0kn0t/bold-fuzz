// SPDX-License-Identifier: GPL-2.0
pragma solidity ^0.8.0;

import {BaseTargetFunctions} from "@chimera/BaseTargetFunctions.sol";
import {BeforeAfter} from "../BeforeAfter.sol";
import {Properties} from "../Properties.sol";
import {vm} from "@chimera/Hevm.sol";
import "src/Zappers/Interfaces/ILeverageZapper.sol";

abstract contract WETHZapperTargets is
    BaseTargetFunctions,
    Properties
{
    /// CUSTOM TARGET FUNCTIONS - Add your own target functions here ///


    /// AUTO GENERATED TARGET FUNCTIONS ///

    function wETHZapper_addCollWithRawETH(uint256 _troveId) public payable asActor {
        wETHZapper.addCollWithRawETH{value: msg.value}(_troveId);
    }

    function wETHZapper_adjustTroveWithRawETH(uint256 _troveId, uint256 _collChange, bool _isCollIncrease, uint256 _boldChange, bool _isDebtIncrease, uint256 _maxUpfrontFee) public payable asActor {
        wETHZapper.adjustTroveWithRawETH{value: msg.value}(_troveId, _collChange, _isCollIncrease, _boldChange, _isDebtIncrease, _maxUpfrontFee);
    }

    function wETHZapper_adjustZombieTroveWithRawETH(uint256 _troveId, uint256 _collChange, bool _isCollIncrease, uint256 _boldChange, bool _isDebtIncrease, uint256 _upperHint, uint256 _lowerHint, uint256 _maxUpfrontFee) public payable asActor {
        wETHZapper.adjustZombieTroveWithRawETH{value: msg.value}(_troveId, _collChange, _isCollIncrease, _boldChange, _isDebtIncrease, _upperHint, _lowerHint, _maxUpfrontFee);
    }

    function wETHZapper_closeTroveFromCollateral(uint256 _troveId, uint256 _flashLoanAmount) public asActor {
        wETHZapper.closeTroveFromCollateral(_troveId, _flashLoanAmount);
    }

    function wETHZapper_closeTroveToRawETH(uint256 _troveId) public asActor {
        wETHZapper.closeTroveToRawETH(_troveId);
    }

    function wETHZapper_openTroveWithRawETH(IZapper.OpenTroveParams memory _params) public payable asActor {
        wETHZapper.openTroveWithRawETH{value: msg.value}(_params);
    }

    function wETHZapper_repayBold(uint256 _troveId, uint256 _boldAmount) public asActor {
        wETHZapper.repayBold(_troveId, _boldAmount);
    }

    function wETHZapper_setAddManager(uint256 _troveId, address _manager) public asActor {
        wETHZapper.setAddManager(_troveId, _manager);
    }

    function wETHZapper_setRemoveManager(uint256 _troveId, address _manager) public asActor {
        wETHZapper.setRemoveManager(_troveId, _manager);
    }

    function wETHZapper_setRemoveManagerWithReceiver(uint256 _troveId, address _manager, address _receiver) public asActor {
        wETHZapper.setRemoveManagerWithReceiver(_troveId, _manager, _receiver);
    }

    function wETHZapper_withdrawBold(uint256 _troveId, uint256 _boldAmount, uint256 _maxUpfrontFee) public asActor {
        wETHZapper.withdrawBold(_troveId, _boldAmount, _maxUpfrontFee);
    }

    function wETHZapper_withdrawCollToRawETH(uint256 _troveId, uint256 _amount) public asActor {
        wETHZapper.withdrawCollToRawETH(_troveId, _amount);
    }
}