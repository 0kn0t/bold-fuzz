// SPDX-License-Identifier: GPL-2.0
pragma solidity ^0.8.0;

import {BaseTargetFunctions} from "@chimera/BaseTargetFunctions.sol";
import {BeforeAfter} from "../BeforeAfter.sol";
import {Properties} from "../Properties.sol";
import {vm} from "@chimera/Hevm.sol";
import "src/TroveManager.sol";

abstract contract TroveManagerTargets is
    BaseTargetFunctions,
    Properties
{
    /// CUSTOM TARGET FUNCTIONS - Add your own target functions here ///


    /// AUTO GENERATED TARGET FUNCTIONS - WARNING: DO NOT DELETE OR MODIFY THIS LINE ///
    function troveManager_batchLiquidateTroves(uint256[] memory _troveArray) public asActor {
        troveManager.batchLiquidateTroves(_troveArray);
    }

    function troveManager_batchLiquidateTroves_clamped() public {
        uint256[] memory _troveArray = new uint256[](1);
        _troveArray[0] = troveId;
        troveManager_batchLiquidateTroves(_troveArray);
    }

    function troveManager_urgentRedemption(uint256 _boldAmount, uint256[] memory _troveIds, uint256 _minCollateral) public asActor {
        troveManager.urgentRedemption(_boldAmount, _troveIds, _minCollateral);
    }
}