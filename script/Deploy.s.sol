pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import { ICREATE3Factory } from "create3-factory/src/ICREATE3Factory.sol";
import { MultichainDeployBaseScript } from "./base/MultichainDeployBase.s.sol";

import { Contract } from "../contracts/Contract.sol";

contract DeployScript is Script, MultichainDeployBaseScript {

    function run() external {
        string memory CONTRACT_VERSION = "App Name v1.0";
        bytes memory contractBytecode = type(Contract).creationCode;

        /*//////////////////////////////////////////////////////////////
                                    TESTNETS
        //////////////////////////////////////////////////////////////*/

        // Testnet names as specified within the `foundry.toml` config file
        string[] memory testnets = new string[](7);
        testnets[0] = "sepolia";
        testnets[1] = "arbitrum-sepolia";
        testnets[2] = "berachain-artio";
        testnets[3] = "mode-sepolia";
        testnets[4] = "avalanche-fuji";
        testnets[5] = "optimism-sepolia";     
        testnets[6] = "sei-devnet";

        deployToChains(testnets, CONTRACT_VERSION, contractBytecode);

        /*//////////////////////////////////////////////////////////////
                                    MAINNETS
        //////////////////////////////////////////////////////////////*/

        // Mainnet names as specified within the `foundry.yoml` config file
        string[] memory mainnets = new string[](2);
        mainnets[0] = "polygon";
        mainnets[1] = "optimism";

        deployToChains(mainnets, CONTRACT_VERSION, contractBytecode);
    }
}