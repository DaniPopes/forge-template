// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "forge-std/console2.sol";

abstract contract BaseTest is Test {
    // 0x5dad7600c5d89fe3824ffa99ec1c3eb8bf3b0501
    address internal constant alice =
        address(uint160(uint256(keccak256(abi.encodePacked("alice")))));
    // 0x3440326f551b8a7ee198cee35cb5d517f2d296a2
    address internal constant bob = address(uint160(uint256(keccak256(abi.encodePacked("bob")))));
    address internal constant dead = 0x000000000000000000000000000000000000dEaD;

    constructor() payable {
        vm.label(alice, "Alice");
        vm.label(bob, "Bob");
        vm.label(address(vm), "VM");
        vm.label(console.CONSOLE_ADDRESS, "Console");
        vm.label(dead, "Dead");
        vm.label(address(0), "address(0)");
    }

    string private label = "1";
    uint256 private gasBefore = 1;
    uint256 private gasCounter = 1;

    function startMeasuringGas(string memory _label) internal virtual {
        label = _label;
        uint256 _gasBefore = gasleft();
        gasBefore = _gasBefore;
    }

    function stopMeasuringGas() internal virtual {
        uint256 gasAfter = gasleft();

        // remove 100 for warm SLOAD
        uint256 gasDelta = gasBefore - gasAfter - 100;
        console.log(string(abi.encodePacked(label, " Gas")), gasDelta);
    }

    function getRandomAddress(uint256 salt) internal virtual returns (address) {
        return address(uint160(getRandom256(salt)));
    }

    function getRandom256(uint256 salt) internal virtual returns (uint256) {
        return uint256(keccak256(abi.encodePacked(salt)));
    }

    function onERC721Received(
        address,
        address,
        uint256,
        bytes calldata
    ) external view virtual returns (bytes4) {
        return this.onERC721Received.selector;
    }

    function onERC1155Received(
        address,
        address,
        uint256,
        uint256,
        bytes calldata
    ) external view virtual returns (bytes4) {
        return this.onERC1155Received.selector;
    }

    function onERC1155BatchReceived(
        address,
        address,
        uint256[] calldata,
        uint256[] calldata,
        bytes calldata
    ) external view virtual returns (bytes4) {
        return this.onERC1155BatchReceived.selector;
    }
}
