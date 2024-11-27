When sending eth or money or transaction on the blockchain, their is always a 'value' field that gets populated and is always populated in the transaction data and most of the time it gets sent with zero.

![image](https://github.com/user-attachments/assets/16b33760-8b46-4e30-84ad-8a2cb02c52ea)

Even in our Metamask, when sending transactions between two accounts that we own, the amount field populates the value field in our transaction.

The 'value' is the amount of native cryptocurrency (Wei) that gets sent with every transaction.

A contract can function as a wallet address, we can send money to it, withdraw from it, interact with it, etc. If we want to make a contract to have the capacity of being used to pay or send funds, we will make then executing function to be payable by adding the `payable` keyword to the function.

1e18 means 1 ETH and also means 1000000000000000000 wei

the message after the comma in the require method means that if the transaction didn't go through, that message would be displayed.

What is a revert? A revert undoes any action that has been done and sends the remaining gas associated with that transaction back.
