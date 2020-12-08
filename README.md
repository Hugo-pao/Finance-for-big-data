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

# Steps in Supply Chain
Given the steps in the supply chain, we have not only implemented a strict Role-Based Access Control system, but also developed 19 stages in the chain (see below for detail) that the product must go through. Using modifiers, the code requires that no step is skipped. Otherwise the code will break. Below, in the deployment, we walk through a concrete Ganache example of all of those steps.

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

To get an overview of all of our methods, consider ```instance.methods```

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
Now, here you might think that there is a problem. The distributor payed 20000 where the farmer only sets a price at 7. We've got you covered. The modifier *checkValue* returns all the exceeding funds.

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
## Distributor processes & packages the chocolate
The functions takes the UPC as input.
```
instance.processedItemByDistributor(42)
instance.packageItemByDistributor(42)
```
## Distributor sells packaged chocolate to manufacturer
The function takes two arguments. The UPC and the price. The distributor makes quite the large margin :) 
```
instance.sellItemByDistributor(42, 30000)
```
## Manufacturer purchases chocolate
Let's add a manufacturer into the mix via ```instance.addManufacturer(accounts[3])```. We, again, can check the ownership and the right permissions by ```instance.ownerLookup()``` and ```instance.isManufacturer()```. Afterwards, we allow the manufacturer to purchase the packaged chocolate. The value cannot be below the distributor's value
```
instance.purchaseItemByManufacturer(42, {value: 30000})
```
## Distributor ships packaged chocolate
```
instance.shippedItemByDistributor(42)
```
## Manufacturer receives, processes & packages chocolate
```
instance.receivedItemByManufacturer(42)
instance.processedItemByManufacturer(42)
instance.packageItemByManufacturer(42)
```
As always, the right permissioned must be followed + the UPC is the argument to the functions.
## Manufacturer sells the chocolate
The manufacturer can set the price for the sold chocolate here. Expectedly, the manufacturer wants to make a margin:
```
instance.sellItemByManufacturer(42, 40000)
```
## Retailer purchasess the chocolate
This function can only be executed as a retailer. Hence, we need to add a retailer to the chain via ```instance.addRetailer(accounts[4])```. The ownership can be checked in the similar way as mentioned above. Now the retailer can send currency to buy the chocolate (must exceed price set by manufacturer).
```
instance.purchaseItemByRetailer(42, {value: 40000})
```
## Manufacturer ships the ready chocolate
The function takes the UPC as input.
```
instance.shippedItemByManufacturer(42)
```
## Retailer receives and sells chocolate
The functions takes the UPC as input. For the selling process, the retailer can name its price as a second argument
```
instance.receivedItemByRetailer(42)
instance.sellItemByRetailer(42, 50000)
```
## Last but not least: Consumer buys chocolate
But first, let's add the consumer to the chain via ```instance.addConsumer(accounts[5])```
Now, finally, we allow the consumer to purchase. By requiring the UPC at this stage we make sure that the entire value chain is covered and the chocolate can be tracked from the consumer to the farmer
```
instance.purchaseItemByConsumer(42, {value: 60000})
```
# Front-end
## Front-end functions
We invision that our front-end app has access to three functions. All of these functions only depend on the UPC, which we imagine to be accessed via a QR code.
```
instance.fetchItemBufferOne(42)
instance.fetchItemBufferTwo(42)
instance.fetchitemHistory(42)
```
The first *fetchItemBufferOne* retrieves information about the farmer such as address and name. Second, the function *fetchItemBufferTwo* gives information about the steps between the farmer and consumer, such as the address of the distributor or manufacturer. Lastly, *fetchitemHistory* returns the blocks that have been created through this supply chain.

