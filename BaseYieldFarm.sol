// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract BaseYieldFarm {
    mapping(address => uint256) public staked;
    
    function stake(uint256 amount) public {
        staked[msg.sender] += amount;
    }

    function emergencyWithdraw() public {
        uint256 amount = staked[msg.sender];
        staked[msg.sender] = 0;
        payable(msg.sender).transfer(amount);
    }
}
