# SimpleStorage.sol

'^' This symbol  tells the browser to use compiler version 0.8.18 or a higher version that might have come out. Without that symbol, the browser will compile strictly with version 0.8.18 >=0.8.18 <0.9.0 this tells the browser that any value between the stated figures is acceptable.

Specifying the license identifier is important to make licensing and sharing code and IP of the smart contract a lot easier from a legal perspective.

## Data types

Data types are used to create variables in Solidity. The data types in Solidity are `bool`, `uint`, `int`, `string`, `address`, and `bytes`.

`bool`- true or false

`uint`- positive unsigned whole number, no decimals or fractions 

`int`- signed whole number, could be positive or negative 

`string`- 

`bytes`

We use these data types to specify the variables we want to create. For instance, `hasFavoriteNumber` is a variable name whose function we don't know. If we initialise it as `bool hasFavoriteNumber;` then we know that it was created to tell whether the variable has or is the favourite number. If we initialise it as `uint hasFavoriteNumber;` then we know that it is a positive whole number that displays the favourite number, if we initialise it as `int hasFavoriteNumber` we will know that it is a whole number that could be positive or negative, etc. If we write `unit hasFavoriteNumber = 88`, it means that the favourite number is 88. 

We can specify the number of bytes we want to use in the case of `uint`, `int`, and `bytes`. The maximum is `uint256`, if you don't specify the number, and write it as `uint`, it defaults to `uint256`. You can have `uint8`, `uint16`, `uint64`, and `uint256`. The bigger the `uint` number, the larger the size capacity. This same rule applies to `int`. 

```

bool hasFavoriteNumfaber = true;
uint256 favouriteNumber = 88;
string favouriteNumberInText = "eighty-eight";
int256 favouriteInt = -88;
address myAddress = 0x......B9A;
bytes favouriteBytes32 = "cat";

```
Strings are byte objects that are strictly for texts. `bytes` have different sizes `bytes2`, `bytes4`, `bytes8`, ... `bytes32`, etc. `bytes` and `bytes32` are not the same. `bytes32` is the largest bytes.

All these data types have their default values. `unit256` is zero, `bool` is false, etc. So, if you define them without assigning values to them, they will initialise to their default values. For example

`uint256 myFavouriteNumber; // 0`

## Functions

Before we delve into functions in Solidity, let us briefly understand the basic structure of a function. `funtion` is the keyword that is used to create a function, `store` is the name of the function and whenever it is called, the commands in the function get executed, `uint256 _favoriteNumber`
is the parameter that is passed into the function. When a function is called, it is called with the parameter. Whenever the function above is called, it sets `favouriteNumber` to `_myFavouriteNumber`.

```
    function store(uint256 _favouriteNumber) public {
        myFavouriteNumber = _favouriteNumber;
    }
```

Functions and variables in Solidity can have one of four specifiers: public, private, external, and internal.
- pubic: visible externally and internally (any other contract or person can call it)
- private: only visible in the current contract (everything on the blockchain is public, so setting a function or variable to private isn't the best way to hide it, it only prevents other contracts from reading or modifying its information).
- external: only visible externally i.e. another function inside this smart contract can't call it(only applies to functions, not variables)
- internal: only visible internally, i.e. only the current contract and its child contract can call it, hence, other contracts or people aren't allowed to call it (if you don't specify visibility for a variable or function, it will default to internal).

The gas cost of a transaction is directly proportional to the lines of code a function has. Therefore, the more lines of code a function has, the higher the gas fees.

```
    function store(uint256 _favouriteNumber) public {
        myFavouriteNumber = _favouriteNumber;
    }
// whenever the function above is called, it sets favouriteNumber to
// _myFavouriteNumber
```
this is way cheaper than the one below

```
    function store(uint256 _favouriteNumber) public {
        myFavouriteNumber = _favouriteNumber;
        myFavouriteNumber = favouriteNumber + 1;
    }

```

Just like in JavaScript, state variables (global variables in JavaScript) can be called or accessed from anywhere within the contract, however, variables defined within the scope can only be accessed from where they were defined.

```
contract SimpleStorage {

    uint256 public myFavouriteNumber;

    function store(uint256 _favouriteNumber) public {
        myFavouriteNumber = _favouriteNumber;
    }

    function retrieve() public view returns(uint256){
        return myFavouriteNumber;
    }
}

```
Solidity has a special keyword that notates functions that don't actually have to run, update the blockchain or send a transaction for you to call them. Those two keywords are `view` and `pure`. A function marked `view` means we are only going to read state on the blockchain. In the `retrieve` function, we are only going to read what the `favouriteNumber` is. 
The `store` function updates the blockchain and sends a transaction, it doesn't read. Once you add the `view` keyword, you've removed the inability of that function to modify the blockchain and send a transaction.

```
contract SimpleStorage {

    uint256 public myFavouriteNumber;

    function store(uint256 _favouriteNumber) public {
        myFavouriteNumber = _favouriteNumber;
    }

    function retrieve() public view returns(uint256){
        myFavouriteNumber = favouriteNumber + 1;
        return myFavouriteNumber;
    }
}

```
The code above will not deploy because of the code `favouriteNumber = favouriteNumber + 1;` and it will display the error message: " function cannot be declared as `view` because this expression (potentially) modifies state", so we will either have to remove that line or the `view` keyword.
The `view` keyword not only allows modifying state but also reading from state or storage. Calling a `view` or `pure` function doesn't cost gas because we are not modifying state. However, if a function that modifies state calls a `view` or `pure` function, it will cost gas. The code below demonstrates this.

```
function store(uint256 _favouriteNumber) public {
    myFavouriteNumber = _favouriteNumber;
    retrieve();
}

function retrieve() public view returns(uint256){
    return myFavouriteNumber;
}

```
As for the `returns` keyword, it just says that whenever we call the `retrieve` function we want to be given the variable of type `uint256`.

## Array
 We have just one favourite number in the code base, and if we want to create a list of favourite numbers, we would have to create an array of favourite numbers. 

`uint256[] listOfFavouriteNumbers`

To specify who the particular person in our array is, we should create a custom type known as `struct`. In Solidity, we can make our custom types using the `struct` keyword. You might liken it to an `object` in JavaScript. The name of the type is the name written after the `struct` keyword. For example, `struct Girl`. The name of this custom type is Girl, so it is a variable of type Girl, like how we have type `bool`, `string`, etc. 

```
struct Person{
        uint256 favouriteNumber;
        string name;
        bool isCool;
    }

```
Since we have our new type, we could create a variable of type `Person` the same way we created a variable of type `myFavouriteNumber`. When  working with custom types we have to specify on the left and right side what type it is like so:

`Person public myFriend = Person({favouriteNumber: 7,name: "Pat")`

`Pat` is a `Person` with a favourite number of `7` and a name of `Pat`they are assigned in the order they are defined in the `struct Person`. When we compile and deploy it, we will see that `favouriteNumber` has an index of 0, `name` has an index of 1, and `isCool` has an index of 2.
If we want to include many people and their favourite numbers, we could add them like this:

```

Person public myFriend = Person({favouriteNumber: 7,name: "Pat")
Person public myFriend = Person({favouriteNumber: 8,name: "Tom)
Person public myFriend = Person({favouriteNumber: 9,name: "Kat")
Person public myFriend = Person({favouriteNumber: 10,name: "Tim")

```
However, this is not a great way to create lists of people. So we can create a new array or list of persons

`Person[] public listOfPeople;` 

The structure of the array above is (type Person, just like we could have type uint256 or type struct), array, visibility = public, name = listOfPeople.
The array above is dynamic (and also empty). It is called a dynamic array because it can grow bigger or shrink to be smaller. If we want to create a static array, we would write it like this:

`Person[3] public listOfPeople;`

This tells the compiler that the size of the array must not exceed 3. So only a maximum of three values can fit into the array. 

Instead of manually updating the array by writing `Person[] public listOfPeople.push(7, "Pat");`, it's best to create a function that once it is called automatically updates the array. So we create the function:

```
function addPerson (string memory _name, uint256 _favouriteNumber){
    listOfPeople.push(Person(_favouriteNumber,_name)

```
`(Person(_favouriteNumber,_name)` is a complete Person that was created inside the function, so that instead of writing `listOfPeople.push(_favouriteNumber, _name)`, we group and push those values as a complete object. 
