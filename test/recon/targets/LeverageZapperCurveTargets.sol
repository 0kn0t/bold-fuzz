// SPDX-License-Identifier: GPL-2.0
pragma solidity ^0.8.0;

import {BaseTargetFunctions} from "@chimera/BaseTargetFunctions.sol";
import {BeforeAfter} from "../BeforeAfter.sol";
import {Properties} from "../Properties.sol";
import {vm} from "@chimera/Hevm.sol";
import "src/Zappers/Interfaces/ILeverageZapper.sol";

abstract contract LeverageZapperCurveTargets is
    BaseTargetFunctions,
    Properties
{
    /// CUSTOM TARGET FUNCTIONS - Add your own target functions here ///


    /// AUTO GENERATED TARGET FUNCTIONS ///

    function leverageZapperCurve_closeTroveFromCollateral(uint256 _troveId, uint256 _flashLoanAmount) public asActor {
        leverageZapperCurve.closeTroveFromCollateral(_troveId, _flashLoanAmount);
    }

    function leverageZapperCurve_leverDownTrove(ILeverageZapper.LeverDownTroveParams memory _params) public asActor {
        leverageZapperCurve.leverDownTrove(_params);
    }

    function leverageZapperCurve_leverUpTrove(ILeverageZapper.LeverUpTroveParams memory _params) public asActor {
        leverageZapperCurve.leverUpTrove(_params);
    }

    function leverageZapperCurve_openLeveragedTroveWithRawETH(ILeverageZapper.OpenLeveragedTroveParams memory _params) public payable asActor {
        leverageZapperCurve.openLeveragedTroveWithRawETH{value: msg.value}(_params);
    }

    function leverageZapperCurve_openTroveWithRawETH(IZapper.OpenTroveParams memory _params) public payable asActor {
        leverageZapperCurve.openTroveWithRawETH{value: msg.value}(_params);
    }
}