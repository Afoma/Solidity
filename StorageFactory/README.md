Remember that to create a variable in Solidity, you have to follow the syntax of 
`type visibility name`

Because with each deployment of the contract below, a new instance of the `SimpleStorage` is created in the `StorageFactory` contract.
```
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {SimpleStorage} from "contracts/SimpleStorage.sol";

contract StorageFactory{

    SimpleStorage public simpleStorage;

    function createSimpleStorage() public{
        simpleStorage = new SimpleStorage();
    }
}
```
However, the deployed contracts are not beig saved, so we will rewrite some parts of the code.

