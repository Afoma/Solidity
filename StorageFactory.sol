// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {SimpleStorage} from "contracts/SimpleStorage.sol";

contract StorageFactory{

    SimpleStorage public simpleStorage;

    function createSimpleStorage() public{
        simpleStorage = new SimpleStorage();
    }
}
