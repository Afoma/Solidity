```
contract SimpleStorage{

    struct Person{
        uint256 favNumber;
        string name;
    }

    Person[] public listOfPeople;

    function addPerson(string memory _name, uint256 _favNumber) public {
        Person memory newPerson = Person(_name, _favNumber);
        listOfPeople.push(newPerson);
}
}
```
```
    struct Person{
        uint256 favNumber;
        string name;
    }
```
this create a custom data type of type `Person` (remember that there a so many data types- uint256, int256, string, etc) and this Person is made of a `favNumber` and a `name` (just like objects in JavaScript). 
`Person[] public listOfPeople;`
this line declares a dynamic array of `Person`(s) (remember that we can have an array of numbers, strings, addresses, etc, but this is an array of the `Person` struct and the name of the array is `listOfPeople`. 
