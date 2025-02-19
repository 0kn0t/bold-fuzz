// SPDX-License-Identifier: GPL-2.0
pragma solidity ^0.8.0;

import {BaseTargetFunctions} from "@chimera/BaseTargetFunctions.sol";
import {BeforeAfter} from "../BeforeAfter.sol";
import {Properties} from "../Properties.sol";
import {vm} from "@chimera/Hevm.sol";

abstract contract DefaultPoolTargets is
    BaseTargetFunctions,
    Properties
{
    /// CUSTOM TARGET FUNCTIONS - Add your own target functions here ///


    /// AUTO GENERATED TARGET FUNCTIONS ///

    function defaultPool_decreaseBoldDebt(uint256 _amount) public asActor { // _requireCallerIsTroveManager
        defaultPool.decreaseBoldDebt(_amount);
    }

    function defaultPool_increaseBoldDebt(uint256 _amount) public asActor { // _requireCallerIsTroveManager
        defaultPool.increaseBoldDebt(_amount);
    }

    function defaultPool_receiveColl(uint256 _amount) public asActor { // _requireCallerIsActivePool
        defaultPool.receiveColl(_amount);
    }

    function defaultPool_sendCollToActivePool(uint256 _amount) public asActor { // _requireCallerIsTroveManager
        defaultPool.sendCollToActivePool(_amount);
    }
}