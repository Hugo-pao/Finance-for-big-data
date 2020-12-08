# Finance for Big Data | Bocconi University

## Project Outline
This project is part of the Finance with Big Data course at Bocconi University. In this repo, we develop a Solidity-based supply chain contract, which is focused on chocolate production. 

We allow for the following participants on our chain: 
- Farmer
- Distributor
- Manufacturer
- Retailer
- Consumer

## Access Control

Access control is immensely important on the blockchain, as we want to control who is allowed to do what in a supply chain. Hence, we followed OpenZeppelin's guidance (https://docs.openzeppelin.com/contracts/2.x/access-control) and implmented a Role-Based Access Control system. These can be found in our accesscontrol folder.

For each of the roles (consumer below as example), we define the following functions:
- isConsumer: checks if the address has the role consumer
- addConsumer: adds current address to consumer role
- renounceConsumer: renounces current role as consumer

## Supply Chain

## Deployment
First time use:
```
run Ganache
cd into project root directory
npm install -g truffle
truffle init (may not be necessary)
```
After that (from project directory):
```
run Ganache
truffle migrate (deploys contracts)
truffle console
let instance = await SupplyChain.deployed()
let accounts = await web3.eth.getAccounts()
```
## Run through the chain
### Farmer
Add a Farmer's account to the chain.

6. instance.contractName(args)

## Front-end