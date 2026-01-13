// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract BaseSwapLite {
    uint256 public fee = 30; // 0.3%

    function getAmountOut(uint256 amountIn, uint256 reserveIn, uint256 reserveOut) public pure returns (uint256) {
        uint256 amountInWithFee = amountIn * 997;
        uint256 numerator = amountInWithFee * reserveOut;
        uint256 denominator = (reserveIn * 1000) + amountInWithFee;
        return numerator / denominator;
    }
}
