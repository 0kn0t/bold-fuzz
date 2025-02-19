// SPDX-License-Identifier: GPL-2.0
pragma solidity ^0.8.0;

// Chimera deps
import {BaseSetup} from "@chimera/BaseSetup.sol";
import {vm} from "@chimera/Hevm.sol";

import "openzeppelin-contracts/contracts/token/ERC20/extensions/IERC20Metadata.sol";

import {TestDeployer} from "../Deployment.t.sol";

// Managers
import {ActorManager} from "./managers/ActorManager.sol";
import {AssetManager} from "./managers/AssetManager.sol";

// Target Contracts
import {ActivePool} from "src/ActivePool.sol";
import {AddressesRegistry} from "src/AddressesRegistry.sol";
import {BoldToken, IBoldToken} from "src/BoldToken.sol";
import {BorrowerOperations} from "src/BorrowerOperations.sol";
import {CollSurplusPool} from "src/CollSurplusPool.sol";
import {CollateralRegistry, ICollateralRegistry} from "src/CollateralRegistry.sol";
import {DefaultPool} from "src/DefaultPool.sol";
import {GasCompZapper} from "src/Zappers/GasCompZapper.sol";
import {LeverageLSTZapper} from "src/Zappers/LeverageLSTZapper.sol";
import {SortedTroves} from "src/SortedTroves.sol";
import {StabilityPool} from "src/StabilityPool.sol";
import {TroveManager} from "src/TroveManager.sol";
import {TroveNFT} from "src/TroveNFT.sol";
import {WETHZapper} from "src/Zappers/WETHZapper.sol";
import {IWETH} from "src/Interfaces/IWETH.sol";

abstract contract Setup is BaseSetup, ActorManager, AssetManager {
    address second_actor = address(0x411c3);

    mapping(address => TestDeployer.LiquityContractsDev) contracts;
    mapping(address => TestDeployer.Zappers) zappers;

    ActivePool activePool;
    AddressesRegistry addressesRegistry;
    BoldToken boldToken;
    BorrowerOperations borrowerOperations;
    CollSurplusPool collSurplusPool;
    CollateralRegistry collateralRegistry;
    DefaultPool defaultPool;
    GasCompZapper gasCompZapper;
    LeverageLSTZapper leverageZapperCurve;
    LeverageLSTZapper leverageZapperUniV3;
    LeverageLSTZapper leverageZapperHybrid;
    SortedTroves sortedTroves;
    StabilityPool stabilityPool;
    TroveManager troveManager;
    TroveNFT troveNFT;
    WETHZapper wETHZapper;
    IERC20Metadata collToken;

    function setup() internal virtual override {
        vm.warp(block.timestamp + 600);
        _addActor(second_actor);


        TestDeployer.TroveManagerParams[] memory troveManagerParamsArray = new TestDeployer.TroveManagerParams[](3);
        troveManagerParamsArray[0] = TestDeployer.TroveManagerParams(150e16, 110e16, 110e16, 5e16, 10e16);
        troveManagerParamsArray[1] = TestDeployer.TroveManagerParams(160e16, 120e16, 120e16, 5e16, 10e16);
        troveManagerParamsArray[2] = TestDeployer.TroveManagerParams(160e16, 125e16, 125e16, 5e16, 10e16);

        TestDeployer deployer = new TestDeployer();
        TestDeployer.LiquityContractsDev[] memory _contractsArray;
        TestDeployer.Zappers[] memory _zappersArray;
        ICollateralRegistry _collateralRegistry;
        IBoldToken _boldToken;
        IWETH weth;
        (_contractsArray, _collateralRegistry, _boldToken,,, weth, _zappersArray) = deployer.deployAndConnectContractsMultiColl(troveManagerParamsArray);
        collateralRegistry = CollateralRegistry(address(_collateralRegistry));
        boldToken = BoldToken(address(_boldToken));

        contracts[address(weth)] = _contractsArray[0];
        zappers[address(weth)] = _zappersArray[1];
        _addAsset(address(weth));
        for(uint i = 1; i < _contractsArray.length; i++) {
            contracts[address(_contractsArray[i].collToken)] = _contractsArray[i];
            zappers[address(_contractsArray[i].collToken)] = _zappersArray[i];
            _addAsset(address(_contractsArray[i].collToken));
        }

        addressesRegistry = AddressesRegistry(_contractsArray[0].addressesRegistry);
        collToken = _contractsArray[0].collToken;
        activePool = ActivePool(address(_contractsArray[0].activePool));
        borrowerOperations = BorrowerOperations(address(_contractsArray[0].borrowerOperations));
        collSurplusPool = CollSurplusPool(address(_contractsArray[0].pools.collSurplusPool));
        defaultPool = DefaultPool(address(_contractsArray[0].pools.defaultPool));
        sortedTroves = SortedTroves(address(_contractsArray[0].sortedTroves));
        stabilityPool = StabilityPool(address(_contractsArray[0].stabilityPool));
        troveManager = TroveManager(address(_contractsArray[0].troveManager));
        troveNFT = TroveNFT(address(_contractsArray[0].troveNFT));
        gasCompZapper = GasCompZapper(payable(address(_zappersArray[0].gasCompZapper)));
        leverageZapperCurve = LeverageLSTZapper(payable(address(_zappersArray[0].leverageZapperCurve)));
        leverageZapperUniV3 = LeverageLSTZapper(payable(address(_zappersArray[0].leverageZapperUniV3)));
        leverageZapperHybrid = LeverageLSTZapper(payable(address(_zappersArray[0].leverageZapperHybrid)));
        wETHZapper = WETHZapper(payable(address(_zappersArray[0].wethZapper)));

    }

    modifier asAdmin {
        vm.prank(address(this));
        _;
    }

    modifier asActor {
        vm.prank(_getActor());
        _;
    }
}
