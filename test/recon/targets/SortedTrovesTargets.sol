// SPDX-License-Identifier: GPL-2.0
pragma solidity ^0.8.0;

import {BaseTargetFunctions} from "@chimera/BaseTargetFunctions.sol";
import {BeforeAfter} from "../BeforeAfter.sol";
import {Properties} from "../Properties.sol";
import {vm} from "@chimera/Hevm.sol";
import "src/SortedTroves.sol";

abstract contract SortedTrovesTargets is
    BaseTargetFunctions,
    Properties
{
    /// CUSTOM TARGET FUNCTIONS - Add your own target functions here ///


    /// AUTO GENERATED TARGET FUNCTIONS ///

//    function sortedTroves_insert(uint256 _id, uint256 _annualInterestRate, uint256 _prevId, uint256 _nextId) public asActor { // _requireCallerIsBorrowerOperations
//        sortedTroves.insert(_id, _annualInterestRate, _prevId, _nextId);
//    }

//    function sortedTroves_insertIntoBatch(uint256 _troveId, BatchId _batchId, uint256 _annualInterestRate, uint256 _prevId, uint256 _nextId) public asActor { // _requireCallerIsBorrowerOperations
//        sortedTroves.insertIntoBatch(_troveId, _batchId, _annualInterestRate, _prevId, _nextId);
//    }

//    function sortedTroves_reInsert(uint256 _id, uint256 _newAnnualInterestRate, uint256 _prevId, uint256 _nextId) public asActor { // _requireCallerIsBorrowerOperations
//        sortedTroves.reInsert(_id, _newAnnualInterestRate, _prevId, _nextId);
//    }

//    function sortedTroves_reInsertBatch(BatchId _id, uint256 _newAnnualInterestRate, uint256 _prevId, uint256 _nextId) public asActor { // _requireCallerIsBorrowerOperations
//        sortedTroves.reInsertBatch(_id, _newAnnualInterestRate, _prevId, _nextId);
//    }

//    function sortedTroves_remove(uint256 _id) public asActor { // _requireCallerIsBOorTM
//        sortedTroves.remove(_id);
//    }

//    function sortedTroves_removeFromBatch(uint256 _id) public asActor { // _requireCallerIsBOorTM
//        sortedTroves.removeFromBatch(_id);
//    }
}