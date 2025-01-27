// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
import {SimpleStorage} from "contracts/SimpleStorage.sol";
contract AddFiveStorage is SimpleStorage{
// the `is` keyword lets `contract AddFiveStorage` inherit all the properties of `contract SimpleStorage`
// with this you can carry out operations on SimpleStorage's ABI
    function store (uint256 _newNumber) public override {
        numbers = _newNumber+5;
    }
}
