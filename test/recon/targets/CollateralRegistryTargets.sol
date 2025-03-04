// SPDX-License-Identifier: GPL-2.0
pragma solidity ^0.8.0;

import {BaseTargetFunctions} from "@chimera/BaseTargetFunctions.sol";
import {BeforeAfter} from "../BeforeAfter.sol";
import {Properties} from "../Properties.sol";
import {vm} from "@chimera/Hevm.sol";
import "src/CollateralRegistry.sol";

abstract contract CollateralRegistryTargets is
    BaseTargetFunctions,
    Properties
{
    /// CUSTOM TARGET FUNCTIONS - Add your own target functions here ///


    /// AUTO GENERATED TARGET FUNCTIONS - WARNING: DO NOT DELETE OR MODIFY THIS LINE ///

    function collateralRegistry_redeemCollateral(uint256 _boldAmount, uint256 _maxIterationsPerCollateral, uint256 _maxFeePercentage) public updateGhosts asActor {
        collateralRegistry.redeemCollateral(_boldAmount, _maxIterationsPerCollateral, _maxFeePercentage);
    }

    function collateralRegistry_redeemCollateral_clamped(uint256 _boldAmount) public {
        _boldAmount = _boldAmount % (boldToken.balanceOf(_getActor()) + 1);
        collateralRegistry_redeemCollateral(_boldAmount, 100, 1e18); // DECIMAL_PRECISION = 1e18
    }
}