READ ME

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

Contract list:
