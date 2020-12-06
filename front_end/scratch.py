import json
import os
from web3 import Web3, HTTPProvider

url = 'HTTP://127.0.0.1:7545'

web3 = Web3(Web3.HTTPProvider(url))

web3.eth.defaultAccount = web3.eth.accounts[0]

compiled_contract_path = 'C:/Users/kampw/OneDrive/Bocconi/2020-2021/Finance With Big Data/Finance-for-big-data/bin/supplychain/SupplyChain.json'

deployed_contract_address = '0x05147303952991879f93b38Dc42180dD85B9E55a'

with open(compiled_contract_path) as file:
    contract_json = json.load(file)  # load contract info as JSON
    contract_abi = contract_json['abi']

contract = web3.eth.contract(address=deployed_contract_address, abi=contract_abi)

msg = contract.functions.addFarmer(deployed_contract_address).call()

functions = contract.functions.isFarmer(deployed_contract_address).call()
