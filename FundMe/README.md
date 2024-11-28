When sending eth or money or transaction on the blockchain, their is always a 'value' field that gets populated and is always populated in the transaction data and most of the time it gets sent with zero.

![image](https://github.com/user-attachments/assets/16b33760-8b46-4e30-84ad-8a2cb02c52ea)

Even in our Metamask, when sending transactions between two accounts that we own, the amount field populates the value field in our transaction.

The 'value' is the amount of native cryptocurrency (Wei) that gets sent with every transaction.

A contract can function as a wallet address, we can send money to it, withdraw from it, interact with it, etc. If we want to make a contract to have the capacity of being used to pay or send funds, we will make then executing function to be payable by adding the `payable` keyword to the function.

1e18 means 1 ETH and also means 1000000000000000000 wei

the message after the comma in the require method means that if the transaction didn't go through, that message would be displayed.

What is a revert? A revert undoes any action that has been done and sends the remaining gas associated with that transaction back.
the require statement within the fund function is the part of the code that can cause a revert. 

`require(msg.value > 1e18, "didn't send enough ETH");`
The condition checks if the sent Ether (msg.value) is greater than 10^18  wei, i.e., 1 ETH.
If the condition evaluates to false (i.e., the sent Ether is ≤1 ETH), the contract will revert the transaction. When a transaction reverts, all changes to the state made during the transaction (like modifying myValue) are undone. The "didn't send enough ETH" string is provided as an error message that is returned to the caller. This helps the caller understand why the transaction failed. 

Successful Transaction:

A user sends 2 ETH to the fund function.
msg.value = 2e18 satisfies the condition 2e18 > 1e18.
The transaction succeeds, myValue is updated, and the function completes.

Failed Transaction:

A user sends 0.5 ETH to the fund function.
msg.value = 0.5e18 does not satisfy the condition 0.5e18 > 1e18.
The require statement causes the transaction to revert, the state is rolled back, and the user receives an error message.

The contract will revert if the fund function is called with ≤1 ETH. The revert is caused by the require statement failing its condition.
If we want to get the real world or native currency equivalent of the cryptocurrency like ETH, Wei, or Gwei, that we're working with, we will have to use oracles (like Chainlink) because smart contracts are "unable to external systems, data feeds, APIs, existing payment systems, or any off-chain resources on their own".
