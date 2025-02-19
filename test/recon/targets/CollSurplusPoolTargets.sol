// SPDX-License-Identifier: GPL-2.0
pragma solidity ^0.8.0;

import {BaseTargetFunctions} from "@chimera/BaseTargetFunctions.sol";
import {BeforeAfter} from "../BeforeAfter.sol";
import {Properties} from "../Properties.sol";
import {vm} from "@chimera/Hevm.sol";

abstract contract CollSurplusPoolTargets is
    BaseTargetFunctions,
    Properties
{
    /// CUSTOM TARGET FUNCTIONS - Add your own target functions here ///


    /// AUTO GENERATED TARGET FUNCTIONS ///

    function collSurplusPool_accountSurplus(address _account, uint256 _amount) public asActor { // _requireCallerIsTroveManager
        collSurplusPool.accountSurplus(_account, _amount);
    }

    function collSurplusPool_claimColl(address _account) public asActor { // _requireCallerIsBorrowerOperations
        collSurplusPool.claimColl(_account);
    }
}