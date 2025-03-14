// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
import {PriceConverter} from "./PriceConverter.sol";
contract FundMe{
    uint256 public minUsd = 5e18;
    address[] public funders;
    mapping (address payer =>uint256 amountPaid) public payerToAmountPaid;

    function fund() public payable{
        require(msg.value.getConversionRate(msg.value) >= minUsd, "not enough ETH");
        funders.push(msg.sender);
        payerToAmountPaid[msg.sender] = payerToAmountPaid[msg.sender] + msg.value;
    }

}
