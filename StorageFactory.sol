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
       function sfStore (uint256 _simplestorageIndex, uint256 _newSimpleStorageNumber) public{
        listOfSimpleStorageContracts[_simplestorageIndex].store(_newSimpleStorageNumber);
        // here we are storing the SimpleStorage contracts indices
    }
        function sfGet (uint256 _simplestorageIndex) public view returns(uint256){
        return listOfSimpleStorageContracts[_simplestorageIndex].retrieve();
    }

        function getlistOfSimpleStorageContractsLength() public view returns(uint256){
        return listOfSimpleStorageContracts.length;
    }
}
    
}
