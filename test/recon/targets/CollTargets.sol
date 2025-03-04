// SPDX-License-Identifier: GPL-2.0
pragma solidity ^0.8.0;

import {BaseTargetFunctions} from "@chimera/BaseTargetFunctions.sol";
import {BeforeAfter} from "../BeforeAfter.sol";
import {Properties} from "../Properties.sol";
import {vm} from "@chimera/Hevm.sol";

abstract contract CollTargets is BaseTargetFunctions, Properties {
    /// CUSTOM TARGET FUNCTIONS - Add your own target functions here ///

    /// AUTO GENERATED TARGET FUNCTIONS ///

    function collToken_approve(address spender, uint256 amount) public asActor {
        collToken.approve(spender, amount);
    }

    function collToken_mint(address _account, uint256 _amount) public asActor {
        // _requireCallerIsBOorAP
        collToken.mint(_account, _amount);
    }

    function collToken_transfer(
        address recipient,
        uint256 amount
    ) public asActor {
        collToken.transfer(recipient, amount);
    }
}
