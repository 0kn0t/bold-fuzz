// SPDX-License-Identifier: GPL-2.0
pragma solidity ^0.8.0;

import {BaseTargetFunctions} from "@chimera/BaseTargetFunctions.sol";
import {BeforeAfter} from "../BeforeAfter.sol";
import {Properties} from "../Properties.sol";
import {vm} from "@chimera/Hevm.sol";
import "src/TroveManager.sol";

abstract contract ActivePoolTargets is
    BaseTargetFunctions,
    Properties
{
    /// CUSTOM TARGET FUNCTIONS - Add your own target functions here ///


    /// AUTO GENERATED TARGET FUNCTIONS ///

    function activePool_accountForReceivedColl(uint256 _amount) public asActor { // _requireCallerIsBorrowerOperationsOrDefaultPool
        activePool.accountForReceivedColl(_amount);
    }

    function activePool_mintAggInterest() public asActor { // _requireCallerIsBOorSP
        activePool.mintAggInterest();
    }

    function activePool_mintAggInterestAndAccountForTroveChange(TroveChange memory _troveChange, address _batchAddress) public asActor { // _requireCallerIsBOorTroveM
        activePool.mintAggInterestAndAccountForTroveChange(_troveChange, _batchAddress);
    }

    function activePool_mintBatchManagementFeeAndAccountForChange(TroveChange memory _troveChange, address _batchAddress) public asActor { // _requireCallerIsTroveManager
        activePool.mintBatchManagementFeeAndAccountForChange(_troveChange, _batchAddress);
    }

    function activePool_receiveColl(uint256 _amount) public asActor { // _requireCallerIsBorrowerOperationsOrDefaultPool
        activePool.receiveColl(_amount);
    }

    function activePool_sendColl(address _account, uint256 _amount) public asActor { // _requireCallerIsBOorTroveMorSP
        activePool.sendColl(_account, _amount);
    }

    function activePool_sendCollToDefaultPool(uint256 _amount) public asActor { // _requireCallerIsTroveManager
        activePool.sendCollToDefaultPool(_amount);
    }

    function activePool_setShutdownFlag() public asActor { // _requireCallerIsTroveManager
        activePool.setShutdownFlag();
    }
}