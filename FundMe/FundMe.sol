// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import {PriceConverter} from "./PriceConverter.sol";

error NotOwner();

contract FundMe{
    uint256 public constant MINIMUM_USD = 5e18;
    // 21,415 gas with constant keyword
    // 23,515 gas without 
    // 21,415 * 141000000000 = $9.058545
    // 23,515 * 141000000000 = $9.946845
    address[] public funders;
    mapping (address =>uint256) public addressToAmountFunded;

    using PriceConverter for uint256;

    address public immutable i_owner;
    // 21,508 gas immutable
    // 23,644 gas without immutable

    constructor(){
        i_owner = msg.sender;
    }

    function fund() public payable{
        require(msg.value.getConversionRate() >= MINIMUM_USD, "not enough ETH");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
    }

    function withdraw() public onlyOwner{
        for (uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        funders = new address[](0);
        (bool callSuccess,) = payable(msg.sender).call{value:address(this).balance}("");
        require(callSuccess, "Transfer failed");
    }

    modifier onlyOwner(){
        // require(msg.sender == i_owner, "Sender not owner");
        // the method above can be written instead of the if statement
        // either of them works
        _;
        if (msg.sender != i_owner) {revert NotOwner();}
    }

}
