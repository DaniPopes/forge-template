// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./utils/BaseTest.sol";

import { Contract } from "../src/Contract.sol";

contract ContractTest is BaseTest {
    Contract internal testContract;

    function setUp() public {
        testContract = new Contract();
        vm.label(address(testContract), "Contract");
        vm.label(address(this), "ContractTest");
    }

    function testExample() public {
        hoax(alice); // vm.deal & vm.prank

        uint256 aliceBefore = alice.balance;
        uint256 bobBefore = bob.balance;
        uint256 amount = 1 ether;
        console.log("Sending", amount);

        assertGe(aliceBefore, amount);
        (bool success, ) = bob.call{ value: amount }("");
        assertTrue(success);

        uint256 aliceDelta = aliceBefore - alice.balance;
        uint256 bobDelta = bob.balance - bobBefore;
        assertEq(aliceDelta, bobDelta);
        assertEq(aliceDelta, amount);

        assertEq(testContract.greet(), "Hello World!");
    }
}
