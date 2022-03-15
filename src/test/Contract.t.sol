// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./utils/BaseTest.sol";

import { Contract } from "../Contract.sol";

contract ContractTest is BaseTest {
    address internal alice;
    address internal bob;
    Contract internal testContract;

    function setUp() public {
        alice = getRandomAddress(123);
        bob = getRandomAddress(321);

        vm.label(alice, "Alice");
        vm.label(bob, "Bob");

        testContract = new Contract();
        vm.label(address(testContract), "Test contract");
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
