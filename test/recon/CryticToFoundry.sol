// SPDX-License-Identifier: GPL-2.0
pragma solidity ^0.8.0;

import {Test, console2 as console} from "forge-std/Test.sol";
import {TargetFunctions} from "./TargetFunctions.sol";
import {FoundryAsserts} from "@chimera/FoundryAsserts.sol";

// forge test --match-contract CryticToFoundry -vv
contract CryticToFoundry is Test, TargetFunctions, FoundryAsserts {
    function setUp() public {
        setup();
    }

    // forge test --match-test test_crytic -vvv
    function test_crytic() public {
        // TODO: add failing property tests here for debugging
        borrowerOperations_registerBatchManager_clamped();
        borrowerOperations_openTroveAndJoinInterestBatchManager_clamped(0, 100e18);
        borrowerOperations_claimCollateral();
    }
}
