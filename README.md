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
**Farmer**

We add the Farmer to the chain.
```
instance.addFarmer(accounts[1])
```
Then, the farmer is allowed to create chocolate via the *produceItemByFarmer* function.
The function takess three inputs:
- UPC: the universal product code, which will continue through the chain
- Farmer's Name
- Price
```
instance.produceItemByFarmer(42,"Loving Choco",5,{from: accounts[0]})
```
Note that the function *produceItemByFarmer* can only be executed as a farmer. The access control implemented under the hood doesnt allow someone else to call this function.

**Distributor**
```
instance.addDistributor(accounts[2])
```
**Manufacturer**
```
instance.addManufacturer(accounts[3])
```
**Retailer**
```
instance.addRetailer(accounts[4])
```
**Consumer**
```
instance.addConsumer(accounts[5])
```

As explained above, the chain allows to check or revoke access. 
For example, if you want to check if account 5 is a farmer, run: 
```
instance.isFarmer(accounts[5])
```
As expected, the output is false allowing for a functioning access control system.

### Step 1: The Farmer produces chocolate
In order to record this step, the farmer runs: 

```
instance.isFarmer(accounts[5])
```


## Front-end
