READ ME

## Main:
This project is part of the Finance with Big Data course at Bocconi University. In this repo, we develop a Solidity-based supply chain contract, which is focused on chocolate production. 



## Contract list:

## Deployment
First time use:
1. run Ganache
2. cd into project root directory
3. npm install -g truffle
4. truffle init (may not be necessary)

After that (from project directory):
1. run Ganache
2. truffle migrate (deploys contracts)
3. truffle console
4. let instance = await SupplyChain.deployed()
5. let accounts = await web3.eth.getAccounts()
6. instance.contractName(args)

## Front-end
