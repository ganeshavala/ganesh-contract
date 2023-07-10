// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/SampleThirdWeb.sol";

contract ContractTest is Test {
    SampleThirdWeb drop;
    address royaltyRecipient = makeAddr("Test");

    function setUp() public {
        drop = new SampleThirdWeb(
            "MintTest",
            "MT",
            royaltyRecipient,
            600,
            royaltyRecipient
        );
    }

    function testExample() public {
        assertTrue(true);
    }

    function testMintWithZeroTokens() public {
        vm.expectRevert("You must atleast mint more than zero tokens");
        drop.mint(royaltyRecipient, 0);
        assertEq(drop.balanceOf(royaltyRecipient), 0);
    }

    function testMintWithTwoTokens() public {
        drop.mint(royaltyRecipient, 2);
        assertEq(drop.balanceOf(royaltyRecipient), 2);
    }
}
