// SPDX-License-Identifier: MIT
pragma solidity 0.8.18; //solidity versions

contract SimpleStorage {

    uint256  myFavouriteNumber;

    struct Person{
        uint256 favouriteNumber;
        string name;
    }

    Person[] public listOfPeople; 

    function store(uint256 _favouriteNumber) public {
        myFavouriteNumber = _favouriteNumber;
    }
    function retrieve() public view returns(uint256){
    return myFavouriteNumber;
    }

    function addPerson(string memory _name, uint256 _favouriteNumber) public {
        listOfPeople.push(Person(_favouriteNumber,_name));
    }


}
