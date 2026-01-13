// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract FundMe {
    uint256 public minimumUsd = 5;

    function fund() public payable {
        require(msg.value > 1e18, "didn't send enough ETH"); // 1 e18 = 1 ETH = 1000000000000000000 = 1 * 10 ** 18
    }

    function withdraw() public {}
}
