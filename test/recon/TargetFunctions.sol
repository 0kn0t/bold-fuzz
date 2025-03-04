// SPDX-License-Identifier: GPL-2.0
pragma solidity ^0.8.0;

// Chimera deps
import {vm} from "@chimera/Hevm.sol";

// Targets
// NOTE: Always import and apply them in alphabetical order, so much easier to debug!
import { AdminTargets } from "./targets/AdminTargets.sol";
import { BorrowerOperationsTargets } from "./targets/BorrowerOperationsTargets.sol";
import { CollateralRegistryTargets } from "./targets/CollateralRegistryTargets.sol";
import { CollTargets } from "./targets/CollTargets.sol";
import { DoomsdayTargets } from "./targets/DoomsdayTargets.sol";
import { ManagersTargets } from "./targets/ManagersTargets.sol";
import { PriceFeedTargets } from "./targets/PriceFeedTargets.sol";
import { StabilityPoolTargets } from "./targets/StabilityPoolTargets.sol";
import { TroveManagerTargets } from "./targets/TroveManagerTargets.sol";

abstract contract TargetFunctions is
    AdminTargets,
    BorrowerOperationsTargets,
    CollateralRegistryTargets,
    DoomsdayTargets,
    ManagersTargets,
    PriceFeedTargets,
    StabilityPoolTargets,
    TroveManagerTargets
{
    /// CUSTOM TARGET FUNCTIONS - Add your own target functions here ///


    /// AUTO GENERATED TARGET FUNCTIONS - WARNING: DO NOT DELETE OR MODIFY THIS LINE ///
}
