// migrating the appropriate contracts

var FarmerRole = artifacts.require("Finance-for-big-data/accesscontrol/Farmer.sol");
var DistributorRole = artifacts.require("Finance-for-big-data/accesscontrol/Distributor.sol");
var ManufacturerRole = artifacts.require("Finance-for-big-data/accesscontrol/Manufacturer.sol");
var RetailerRole = artifacts.require("Finance-for-big-data/accesscontrol/Retailer.sol");
var ConsumerRole = artifacts.require("Finance-for-big-data/accesscontrol/Consumer.sol");
var SupplyChain = artifacts.require("Finance-for-big-data/supplychain/chain.sol");

module.exports = function(deployer) {
  deployer.deploy(FarmerRole);
  deployer.deploy(DistributorRole);
  deployer.deploy(ManufacturerRole);
  deployer.deploy(RetailerRole);
  deployer.deploy(ConsumerRole);
  deployer.deploy(SupplyChain);
};
