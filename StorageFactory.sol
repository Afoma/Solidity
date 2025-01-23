// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {SimpleStorage} from "contracts/SimpleStorage.sol";

contract StorageFactory{

    SimpleStorage[] public listOfSimpleStorageContracts;

    function createSimpleStorage() public{
        SimpleStorage newSimpleStorage = new SimpleStorage();
        listOfSimpleStorageContracts.push(newSimpleStorage);
    }
// the code above can be re-written like this
// listOfSimpleStorageContracts.push(new SimpleStorage();
    function sfStore(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public{
        SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
        mySimpleStorage.store(_newSimpleStorageNumber);
    }
    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256){
        SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
        return mySimpleStorage.retrieve();
    }
        function getlistOfSimpleStorageContractsLength() public view returns(uint256){
        return listOfSimpleStorageContracts.length;
    }
}
    
}
