// SPDX-License-Identifier: MIT
pragma solidity 0.8.18; //solidity versions

contract SimpleStorage {
    
    // a state variable that allows for only the storage of figures
    uint256 public myFavouriteNumber;

    // a custom variable. Solidity allows the creation of custom variables, it is
    // also a storage variable. State variables- variables that are defined outside 
    // the scope of a function are storage variables.

    struct Person{
        uint256 favouriteNumber;
        string name;
    }

    Person[] public listOfPeople; 

    // this maps or links a string to a number, just like in a dictionary

    mapping(string => uint256) public nameToFavouriteNumber;

    // whatever number I put in this function will be stored in/as myFavouriteNumber

    function store(uint256 _favouriteNumber) public {
        myFavouriteNumber = _favouriteNumber;
    }

    // if I want to retrieve the current value of uint256 myFavouriteNumber

    function retrieve() public view returns(uint256){
    return myFavouriteNumber;
    }

    // if I want to add names and favourite numbers to the listOfPeople array
    // if I also want to search for the favourite number that is mapped to 
    // the name of the person that I'm searching for

    function addPerson(string memory _name, uint256 _favouriteNumber) public {
        listOfPeople.push(Person(_favouriteNumber,_name));
        nameToFavouriteNumber[_name] = _favouriteNumber;
    }

    // if I want to return the entire list of people in one go

    function displayListOfPeople() public view returns(Person[] memory){
        return listOfPeople;
    }


}
