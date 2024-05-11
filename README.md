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

`uint256 favouriteNumber; // 0`

## Functions

Functions and variables in SOlidity can have one of four specifiers: public, private, external, and internal.
- pubic: visible externally and internally (any other contract can call it)
- private: only visible in the current contract (everything on the blockchain is public, so setting a function or variable to private isn't the best way to hide it.
- external: only visible externally(only applies to functions, not variables)
- internal: only visible internally

The gas cost of a transaction is directly proportional to the lines of code a function has. Therefore, the more lines of code a function has, the higher the gas fees.

```
    function store(uint256 _favouriteNumber) public {
        favouriteNumber = _favouriteNumber;
    }
```
this is way cheaper than the one below

```
    function store(uint256 _favouriteNumber) public {
        favouriteNumber = _favouriteNumber;
        favouriteNumber = favouriteNumber + 1;
    }

```

Just like in JavaScript, state variables (global variables in JavaScript) can be called or accessed from anywhere within the contract, however, variables defined within the scope can only be accessed from where they were defined.

```
contract SimpleStorage {

    uint256 public favouriteNumber;

    function store(uint256 _favouriteNumber) public {
        favouriteNumber = _favouriteNumber;
    }

    function retrieve() public view returns(uint256){
        return favouriteNumber;
    }
}

```
Solidity has a special keyword which notates functions that don't actually have to run, update the blockchain or send a transaction for you to call them. Those two keywords are `view` and `pure`. A function marked `view` means we are only going to read state on the blockchain. In the `retrieve` function, we are only going to read what the `favouriteNumber` is. 
The `store` function updates the blockchain and sends a transaction, it doesn't read. Once you add the `view` keyword, you've removed the inability of that function to modify the blockchain and send a transaction.

```
contract SimpleStorage {

    uint256 public favouriteNumber;

    function store(uint256 _favouriteNumber) public {
        favouriteNumber = _favouriteNumber;
    }

    function retrieve() public view returns(uint256){
        favouriteNumber = favouriteNumber + 1;
        return favouriteNumber;
    }
}

```
The code above will not deploy because of line 96 (error message: function cannot be declared as `view` because this expression (potentially) modifies state), so we will either have to remove that line or the `view` keyword.
The `view` keyword doesn't only disallow modifying state but also reading from state or storage. Calling a `view` or `pure` function doesn't cost gas because we are not modifying state. However, if a function that modifies state calls a `view` or `pure` function, it will cost gas. The code below demonstrates this.

```
function store(uint256 _favouriteNumber) public {
    favouriteNumber = _favouriteNumber;
    retrieve();
}

function retrieve() public view returns(uint256){
    return favouriteNumber;
}

```
As for the `returns` keyword, it just says that whenever we call the `retrieve` function we want to be given the variable of type `uint256`.
