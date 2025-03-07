// SPDX-License-Identifier: GPL-2.0
pragma solidity ^0.8.0;

import {BaseTargetFunctions} from "@chimera/BaseTargetFunctions.sol";
import {vm} from "@chimera/Hevm.sol";
import "forge-std/console2.sol";

import {Properties} from "../Properties.sol";

abstract contract PriceFeedTargets is BaseTargetFunctions, Properties  {
    function priceFeed_setPrice(uint88 price) public updateGhosts {
        priceFeed.setPrice(price);
    }

    // function borrowerOperations_shutdownFromOracleFailure() public {
    //     vm.prank(address(priceFeed));
    //     borrowerOperations.shutdownFromOracleFailure();
    // }
}