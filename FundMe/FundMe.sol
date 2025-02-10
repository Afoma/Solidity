// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe{
    // Get Funds
    // Withdraw funds
    // Set minimum funding vaLue in USD
    uint256 public minUsd = 5;

    function fund() public payable{
    // Allow users to send $
    // Have minimum $ sent
    // How do we send ETH to this contract
    
        require(msg.value >= minUsd, "didn't send enough ETH");
    }
    function getFunds() public{
        // Address 0x694AA1769357215DE4FAC081bf1f309aDC325306
        // ABI
    }
    function getConversionRate() public{

    }
    function getVersion() public view returns(uint256){
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }
}
