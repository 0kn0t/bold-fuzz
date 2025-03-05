// SPDX-License-Identifier: GPL-2.0
pragma solidity ^0.8.0;

import {Asserts} from "@chimera/Asserts.sol";
import {BeforeAfter} from "./BeforeAfter.sol";

abstract contract Properties is BeforeAfter, Asserts {
    function property_critical_mode() public {
        // when TCR ≤ CCR => Disables operations like opening or adjusting Troves but allows debt repayment, interest rate changes, or actions improving the collateral ratio.
        uint256 price = priceFeed.getPrice();
        uint256 TCR = troveManager.getTCR(price);
        uint256 CCR = troveManager.get_CCR();
        if(TCR <= CCR) {
            assert(false);
        }
    }
}