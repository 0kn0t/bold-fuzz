// SPDX-License-Identifier: GPL-2.0
pragma solidity ^0.8.0;

import {BaseTargetFunctions} from "@chimera/BaseTargetFunctions.sol";
import {BeforeAfter} from "../BeforeAfter.sol";
import {Properties} from "../Properties.sol";
import {vm} from "@chimera/Hevm.sol";

abstract contract BoldTokenTargets is
    BaseTargetFunctions,
    Properties
{
    /// CUSTOM TARGET FUNCTIONS - Add your own target functions here ///


    /// AUTO GENERATED TARGET FUNCTIONS ///

    function boldToken_approve(address spender, uint256 amount) public asActor {
        boldToken.approve(spender, amount);
    }

    function boldToken_burn(address _account, uint256 _amount) public asActor {
        boldToken.burn(_account, _amount);
    }

    function boldToken_decreaseAllowance(address spender, uint256 subtractedValue) public asActor {
        boldToken.decreaseAllowance(spender, subtractedValue);
    }

    function boldToken_increaseAllowance(address spender, uint256 addedValue) public asActor {
        boldToken.increaseAllowance(spender, addedValue);
    }

//    function boldToken_mint(address _account, uint256 _amount) public asActor { // _requireCallerIsBOorAP
//        boldToken.mint(_account, _amount);
//    }

//    function boldToken_permit(address owner, address spender, uint256 value, uint256 deadline, uint8 v, bytes32 r, bytes32 s) public asActor {
//        boldToken.permit(owner, spender, value, deadline, v, r, s);
//    }

//    function boldToken_returnFromPool(address _poolAddress, address _receiver, uint256 _amount) public asActor { // _requireCallerIsStabilityPool
//        boldToken.returnFromPool(_poolAddress, _receiver, _amount);
//    }

//    function boldToken_sendToPool(address _sender, address _poolAddress, uint256 _amount) public asActor {  // _requireCallerIsStabilityPool
//        boldToken.sendToPool(_sender, _poolAddress, _amount);
//    }

    function boldToken_transfer(address recipient, uint256 amount) public asActor {
        boldToken.transfer(recipient, amount);
    }
}