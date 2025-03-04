// SPDX-License-Identifier: GPL-2.0
pragma solidity ^0.8.0;

// Chimera deps
import {BaseSetup} from "@chimera/BaseSetup.sol";
import {vm} from "@chimera/Hevm.sol";


import {TestDeployer} from "../Deployment.t.sol";
import {ERC20Faucet} from "../mocks/ERC20Faucet.sol";

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
import {MockERC20} from "./mocks/MockERC20.sol";
import {PriceFeedTestnet} from "../mocks/PriceFeedTestnet.sol";
import {TroveManagerTester} from "../mocks/TroveManagerTester.t.sol";
import {IWETH} from "src/Interfaces/IWETH.sol";
import {HintHelpers} from "src/HintHelpers.sol";

abstract contract Setup is BaseSetup, ActorManager, AssetManager {
    address second_actor = address(0x411c3);

    mapping(address => TestDeployer.LiquityContractsDev) contracts;

    uint256 troveId;
    address batchManager;

    uint256 constant OPEN_TROVE_BORROWED_MIN = 2_000 ether;
    uint256 constant OPEN_TROVE_BORROWED_MAX = 100_000 ether;
    uint256 constant OPEN_TROVE_ICR = 1.5 ether; // CCR

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
    TroveManagerTester troveManager;
    TroveNFT troveNFT;
    MockERC20 collToken;
    HintHelpers hintHelpers;
    PriceFeedTestnet priceFeed;

    function setup() internal virtual override {
        vm.warp(block.timestamp + 600);
        _addActor(second_actor);

        TestDeployer.TroveManagerParams[] memory troveManagerParamsArray = new TestDeployer.TroveManagerParams[](2);
        troveManagerParamsArray[0] = TestDeployer.TroveManagerParams(150e16, 110e16, 110e16, 5e16, 10e16);
        troveManagerParamsArray[1] = TestDeployer.TroveManagerParams(160e16, 120e16, 120e16, 5e16, 10e16);
        TestDeployer deployer = new TestDeployer();
        TestDeployer.LiquityContractsDev[] memory _contractsArray;
        ICollateralRegistry _collateralRegistry;
        IBoldToken _boldToken;
        IWETH weth;
        (
            _contractsArray,
            _collateralRegistry,
            _boldToken,
            hintHelpers,
            ,
            weth,
        ) = deployer.deployAndConnectContractsMultiColl(
            troveManagerParamsArray
        );
        collateralRegistry = CollateralRegistry(address(_collateralRegistry));
        boldToken = BoldToken(address(_boldToken));
        contracts[address(weth)] = _contractsArray[0];
        _addAsset(address(weth));
        _switchAsset(0);
        for (uint i = 1; i < _contractsArray.length; i++) {
            contracts[address(_contractsArray[i].collToken)] = _contractsArray[
                i
            ];
            _addAsset(address(_contractsArray[i].collToken));
        }

        addressesRegistry = _contractsArray[0].addressesRegistry;
        collToken = MockERC20(address(_contractsArray[0].collToken));
        activePool = _contractsArray[0].activePool;
        borrowerOperations = _contractsArray[0].borrowerOperations;
        collSurplusPool = _contractsArray[0].pools.collSurplusPool;
        defaultPool = _contractsArray[0].pools.defaultPool;
        priceFeed = _contractsArray[0].priceFeed;
        sortedTroves = _contractsArray[0].sortedTroves;
        stabilityPool = _contractsArray[0].stabilityPool;
        troveManager = _contractsArray[0].troveManager;

        for (uint256 c = 0; c < 2; c++) {
            for (uint256 i = 0; i < _getActors().length; i++) {
                address actor = _getActors()[i];
                address token = _getAssets()[c];
                ERC20Faucet(token).mint(actor, 1000e18);
                vm.prank(actor);
                ERC20Faucet(token).approve(
                    address(contracts[token].borrowerOperations),
                    type(uint256).max
                );
                vm.prank(actor);
                weth.approve(
                    address(contracts[token].borrowerOperations),
                    type(uint256).max
                );
            }
        }
    }
}
