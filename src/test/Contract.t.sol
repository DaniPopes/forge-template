// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { DSTest } from "ds-test/test.sol";
import { Utilities } from "./utils/Utilities.sol";
import { console } from "./utils/Console.sol";
import { VM } from "./utils/VM.sol";

contract ContractTest is DSTest {
	VM internal immutable vm = VM(HEVM_ADDRESS);

	Utilities internal utils;
	address payable[] internal users;

	function setUp() public {
		utils = new Utilities();
		users = utils.createUsers(5);
	}

	function testExample() public {
		address payable alice = users[0];
		console.log("alice's address", alice);
		address payable bob = users[1];
		hevm.prank(alice);
		// solhint-disable-next-line avoid-low-level-calls
		(bool sent, ) = bob.call{ value: 10 ether }("");
		assertTrue(sent);
		assertGt(bob.balance, alice.balance);
	}
}
