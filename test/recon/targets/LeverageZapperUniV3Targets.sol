// SPDX-License-Identifier: GPL-2.0
pragma solidity ^0.8.0;

import {BaseTargetFunctions} from "@chimera/BaseTargetFunctions.sol";
import {BeforeAfter} from "../BeforeAfter.sol";
import {Properties} from "../Properties.sol";
import {vm} from "@chimera/Hevm.sol";
import "src/Zappers/Interfaces/ILeverageZapper.sol";

abstract contract LeverageZapperUniV3Targets is
    BaseTargetFunctions,
    Properties
{
    /// CUSTOM TARGET FUNCTIONS - Add your own target functions here ///


    /// AUTO GENERATED TARGET FUNCTIONS ///

    function leverageZapperUniV3_closeTroveFromCollateral(uint256 _troveId, uint256 _flashLoanAmount) public asActor {
        leverageZapperUniV3.closeTroveFromCollateral(_troveId, _flashLoanAmount);
    }

    function leverageZapperUniV3_leverDownTrove(ILeverageZapper.LeverDownTroveParams memory _params) public asActor {
        leverageZapperUniV3.leverDownTrove(_params);
    }

    function leverageZapperUniV3_leverUpTrove(ILeverageZapper.LeverUpTroveParams memory _params) public asActor {
        leverageZapperUniV3.leverUpTrove(_params);
    }

    function leverageZapperUniV3_openLeveragedTroveWithRawETH(ILeverageZapper.OpenLeveragedTroveParams memory _params) public payable asActor {
        leverageZapperUniV3.openLeveragedTroveWithRawETH{value: msg.value}(_params);
    }

    function leverageZapperUniV3_openTroveWithRawETH(IZapper.OpenTroveParams memory _params) public payable asActor {
        leverageZapperUniV3.openTroveWithRawETH{value: msg.value}(_params);
    }
}