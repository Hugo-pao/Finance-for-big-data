# Finance for Big Data | Bocconi University

# Project Outline
This project is part of the Finance with Big Data course at Bocconi University. In this repo, we develop a Solidity-based supply chain contract, which is focused on chocolate production. 

We allow for the following participants on our chain: 
- Farmer
- Distributor
- Manufacturer
- Retailer
- Consumer

# Access Control

Access control is immensely important on the blockchain, as we want to control who is allowed to do what in a supply chain. Hence, we followed OpenZeppelin's guidance (https://docs.openzeppelin.com/contracts/2.x/access-control) and implmented a Role-Based Access Control system. These can be found in our accesscontrol folder.

For each of the roles (consumer below as example), we define the following functions:
- isConsumer: checks if the address has the role consumer
- addConsumer: adds current address to consumer role
- renounceConsumer: renounces current role as consumer

# Supply Chain Deployment
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
## Farmer added
We add the farmer to the chain.
```
instance.addFarmer(accounts[1])
```
## Farmer produces chocolate
Then, the farmer is allowed to create chocolate via the *produceItemByFarmer* function.
The function takess three inputs:
- UPC: the universal product code, which will continue through the chain
- Farmer's Name
- Price
```
instance.produceItemByFarmer(42,"Loving Choco",5,{from: accounts[0]})
```
Note that the function *produceItemByFarmer* can only be executed as a farmer. The access control implemented under the hood doesnt allow someone else to call this function.
## Farmer sells chocolate
Only the farmer is allowed to access this function. Further, the UPC need to be the same as the UPC produced above. 
The function takes two parameters:
- UPC
- Price
```
instance.sellItemByFarmer(42, 7,{from: accounts[0]})
```
## Distributor purchases chocolate
Now, we add the distributor role
```
instance.addDistributor(accounts[2])
```
Let's check who is the current owner via: ```instance.ownerLookup()``` and check with ```instance.isDistributor``` that the correct account has access.
Given this is true, we allow the distributor to buy chocolate via ```purchaseItemByDistributor```. The function takes the same UPC as an input as our chain dicates. The distributor now sends currency to obtain the chcocolate. For this, the msg.value needs to exceed the price set by the farmer. We check this via the *paidEnough* modifier.
```
instance.purchaseItemByDistributor(42, {value: 20000})
```
## Farmer ships chocolate
After the farmer receives the funds, the farmer ships the chocolate. Again, the UPC must fit and the function can only be executed from a farmer.
```
instance.shippedItemByFarmer(42)
```
## Distributor receives chocolate
By now, the game remains the same: Only distributor can execute, UPC must fit.
```
instance.receivedItemByDistributor(42)
```
## Distributor processes the chocolate
The distributor processes the chocolate. The function takes the UPC as input.
```
instance.processedItemByDistributor(42)
```
## Distributor packages the chocolate
The distributor packages the chocolate. The function takes the UPC as input.
```
instance.packageItemByDistributor(42)
```
## 






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


# Front-end
