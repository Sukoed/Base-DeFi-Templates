// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract BaseLending {
    mapping(address => uint256) public collateral;
    mapping(address => uint256) public debt;

    function depositCollateral() public payable {
        collateral[msg.sender] += msg.value;
    }

    function borrow(uint256 amount) public {
        require(collateral[msg.sender] >= amount * 2, "Not enough collateral");
        debt[msg.sender] += amount;
        payable(msg.sender).transfer(amount);
    }
}
