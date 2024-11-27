// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
contract FundMe{
    // Get Funds
    // Withdraw funds
    // Set minimum funding vaLue in USD
    function fund() public payable{
        require(msg.value > 1e18, "didn't send enough ETH");
    }
}
