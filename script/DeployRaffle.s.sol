//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {Raffle} from "../src/Raffle.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

contract DeployRaffle is Script {
    function run() external returns (Raffle) {
        HelperConfig helperConfig = new HelperConfig();

        (
            uint256 entranceFee,
            uint256 interval,
            address vrfCoordinator,
            bytes32 keyHash,
            uint32 callbackGasLimit,
            uint256 subscriptionId
        ) = helperConfig.localNetworkConfig();

        vm.startBroadcast();
        Raffle raffle = new Raffle(
            entranceFee,
            interval,
            vrfCoordinator,
            keyHash,
            callbackGasLimit,
            subscriptionId
        );
        vm.stopBroadcast();

        return raffle;
    }

    function deployContract() public returns (Raffle, HelperConfig) {
        //HelperConfig config = new
    }
}
