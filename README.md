# SimpleStorage.sol

'^' This symbol  tells the browser to use compiler version 0.8.18 or a higher version that might have come out. Without that symbol, the browser will compile strictly with version 0.8.18 >=0.8.18 <0.9.0 this tells the browser that any value between the stated figures is acceptable.

Specifying the license identifier is important to make licensing and sharing code and IP of the smart contract a lot easier from a legal perspective.

Data types are used to create variables in Solidity. The data types in Solidity are `bool`, `uint`, `int`, `string`, `address`, and `bytes`.
`bool`- true or false
`uint`- positive unsigned whole number, no decimals or fractions 
`int`- signed whole number, could be positive or negative 
`string`- 
`bytes`

We can specify the number of bytes we want to use in the case of `uint`, `int`, and `bytes`. The maximum is `uint256`, if you don't specify the number, and write it as `uint`, it defaults to `uint256`. You can have `uint8`, `uint16`, `uint64`, and `uint256`. The bigger the `uint` number, the larger the size capacity.
For instance, `hasFavoriteNumber` is a variable that was made to display whether the variable has its favourite number or not. By writing it as `bool hasFavouriyeNumber`, Solidity already knows it is a boolean that can display whether or not a variable is a favourite number. 

If we write `unit hasFavoriteNumber = 88`, it means that the favourite number is 88. 
