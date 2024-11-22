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
```
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {SimpleStorage} from "contracts/SimpleStorage.sol";

contract StorageFactory{

    SimpleStorage[] public listOfSimpleStorageContracts;

    function createSimpleStorage() public{
        SimpleStorage newSimpleStorage = new SimpleStorage();
        listOfSimpleStorageContracts.push(newSimpleStorage);
    }
}
```
notice that ` SimpleStorage newSimpleStorage` doesn't have memory in between. this is because contracts are not deployed to memory but to the blockchain, hence to storage references and not memory.
for us to interact with other contracts or some parts of another contract, we need two things- address and ABI (Application Binary Interface). the ABI tells our code exactly how it can interact with another contract. 


in the first part of a function, if there will be parameters, they will have names but in a return function, the paramters or the things in the bracket won't have names but they will only be displayed as the variable types like `uint256`, `string memory`, `address`, etc, like this
```
    function retrieve() public view returns (string memory, uint256) {
        return (names, numbers);
    }
```

it is the data set `string, uint256` that is written in the `returns` statement that tells the compiler what the function will be returning and not by the name `names, numbers` the `return` keyword intends to return because that is just an english name and the compiler converts code and not english to byte-readable code. however, it is best practise to give meaningful names so that the code will be easily understandable by a human being.
