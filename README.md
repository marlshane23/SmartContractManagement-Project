# Smart Contract Management
This project is a simple banking system implemented as a smart contract on the Ethereum blockchain. It allows the owner of the contract to deposit and withdraw Ether. The contract also keeps track of its balance and emits events when a deposit or withdrawal is made.

## Description
The smart contract is written in Solidity and uses the index.js library for interacting with the Ethereum blockchain. The contract has several functions for managing the balance, including deposit and withdraw functions. It also includes a balance function for checking the balance of the contract. The contract uses a modifier to ensure that only the owner can call certain functions. Events are emitted when a deposit or withdrawal is made, which can be useful for tracking transactions.

## Getting Started

### Executing program
*To compile the contract, navigate to the project directory and run the following command:
npx hardhat compile

*To deploy the contract to a local Hardhat network, run the following command:
npx hardhat run scripts/deploy.js --network localhost

*To run the front-end, run the following command:
npm run dev

After this, the project will be running on your localhost. Typically at http://localhost:3000/

## Authors
Marl Shane G. Esteron

