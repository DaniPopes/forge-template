// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";

import { Contract } from "../src/Contract.sol";

contract ContractScript is Script {
    Contract public testContract;

    function run() public {
        vm.broadcast();
        testContract = new Contract();
    }
}
