// SPDX-License-Identifier: GPL-2.0
pragma solidity ^0.8.0;

import {BaseTargetFunctions} from "@chimera/BaseTargetFunctions.sol";
import {BeforeAfter} from "../BeforeAfter.sol";
import {Properties} from "../Properties.sol";
import {vm} from "@chimera/Hevm.sol";
import "src/Zappers/Interfaces/ILeverageZapper.sol";

abstract contract LeverageZapperHybridTargets is
    BaseTargetFunctions,
    Properties
{
    /// CUSTOM TARGET FUNCTIONS - Add your own target functions here ///


    /// AUTO GENERATED TARGET FUNCTIONS ///

    function leverageZapperHybrid_closeTroveFromCollateral(uint256 _troveId, uint256 _flashLoanAmount) public asActor {
        leverageZapperHybrid.closeTroveFromCollateral(_troveId, _flashLoanAmount);
    }

    function leverageZapperHybrid_leverDownTrove(ILeverageZapper.LeverDownTroveParams memory _params) public asActor {
        leverageZapperHybrid.leverDownTrove(_params);
    }

    function leverageZapperHybrid_leverUpTrove(ILeverageZapper.LeverUpTroveParams memory _params) public asActor {
        leverageZapperHybrid.leverUpTrove(_params);
    }

    function leverageZapperHybrid_openLeveragedTroveWithRawETH(ILeverageZapper.OpenLeveragedTroveParams memory _params) public payable asActor {
        leverageZapperHybrid.openLeveragedTroveWithRawETH{value: msg.value}(_params);
    }

    function leverageZapperHybrid_openTroveWithRawETH(IZapper.OpenTroveParams memory _params) public payable asActor {
        leverageZapperHybrid.openTroveWithRawETH{value: msg.value}(_params);
    }
}