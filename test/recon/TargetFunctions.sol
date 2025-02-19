// SPDX-License-Identifier: GPL-2.0
pragma solidity ^0.8.0;

// Chimera deps
import {vm} from "@chimera/Hevm.sol";

// Targets
// NOTE: Always import and apply them in alphabetical order, so much easier to debug!
import {ActivePoolTargets} from "./targets/ActivePoolTargets.sol";
import {AddressesRegistryTargets} from "./targets/AddressesRegistryTargets.sol";
import {AdminTargets} from "./targets/AdminTargets.sol";
import {BoldTokenTargets} from "./targets/BoldTokenTargets.sol";
import {BorrowerOperationsTargets} from "./targets/BorrowerOperationsTargets.sol";
import {CollSurplusPoolTargets} from "./targets/CollSurplusPoolTargets.sol";
import {CollateralRegistryTargets} from "./targets/CollateralRegistryTargets.sol";
import {DefaultPoolTargets} from "./targets/DefaultPoolTargets.sol";
import {DoomsdayTargets} from "./targets/DoomsdayTargets.sol";
import {GasCompZapperTargets} from "./targets/GasCompZapperTargets.sol";
import {LeverageZapperCurveTargets} from "./targets/LeverageZapperCurveTargets.sol";
import {LeverageZapperHybridTargets} from "./targets/LeverageZapperHybridTargets.sol";
import {LeverageZapperUniV3Targets} from "./targets/LeverageZapperUniV3Targets.sol";
import {ManagersTargets} from "./targets/ManagersTargets.sol";
import {SortedTrovesTargets} from "./targets/SortedTrovesTargets.sol";
import {StabilityPoolTargets} from "./targets/StabilityPoolTargets.sol";
import {TroveManagerTargets} from "./targets/TroveManagerTargets.sol";
import {TroveNFTTargets} from "./targets/TroveNFTTargets.sol";
import {WETHZapperTargets} from "./targets/WETHZapperTargets.sol";

abstract contract TargetFunctions is
    ActivePoolTargets,
    AddressesRegistryTargets,
    AdminTargets,
    BoldTokenTargets,
    BorrowerOperationsTargets,
    CollSurplusPoolTargets,
    CollateralRegistryTargets,
    DefaultPoolTargets,
    DoomsdayTargets,
    GasCompZapperTargets,
    LeverageZapperCurveTargets,
    LeverageZapperHybridTargets,
    LeverageZapperUniV3Targets,
    ManagersTargets,
    SortedTrovesTargets,
    StabilityPoolTargets,
    TroveManagerTargets,
    TroveNFTTargets,
    WETHZapperTargets
{
    /// CUSTOM TARGET FUNCTIONS - Add your own target functions here ///

    /// AUTO GENERATED TARGET FUNCTIONS ///
}
