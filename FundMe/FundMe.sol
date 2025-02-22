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
    function getPrice() public view returns(uint256){
        // Address 0x694AA1769357215DE4FAC081bf1f309aDC325306
        // ABI
        AggregatorV3Interface dataFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int256 answer, , ,) = dataFeed.latestRoundData();
        return uint256(answer * 1e10);
        // Price of ETH in USD
        // 200000000000
        // `answer` is in int256 data type because some price feeds could be in the negative
        // and `int` stands for integer which could be positive or negative
    }

    function getConversionRate(uint256 ethAmount) public view returns(uint256){
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }

    function getDecimals() public view returns(uint8){
        AggregatorV3Interface dataFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        return dataFeed.decimals();
    }
    
    function getVersion() public view returns(uint256){
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }

}
