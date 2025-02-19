// SPDX-License-Identifier: GPL-2.0
pragma solidity ^0.8.0;

import {BaseTargetFunctions} from "@chimera/BaseTargetFunctions.sol";
import {BeforeAfter} from "../BeforeAfter.sol";
import {Properties} from "../Properties.sol";
import {vm} from "@chimera/Hevm.sol";
import "src/AddressesRegistry.sol";

abstract contract AddressesRegistryTargets is
    BaseTargetFunctions,
    Properties
{
    /// CUSTOM TARGET FUNCTIONS - Add your own target functions here ///


    /// AUTO GENERATED TARGET FUNCTIONS ///

//    function addressesRegistry_setAddresses(IAddressesRegistry.AddressVars memory _vars) public asActor {
//        addressesRegistry.setAddresses(_vars);
//    }
}