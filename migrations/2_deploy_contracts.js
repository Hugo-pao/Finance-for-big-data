// migrating the appropriate contracts

//check file names of .sol roles

var FarmerRole = artifacts.require("./Farmer.sol");
var DistributorRole = artifacts.require("./Distributor.sol");
var ManufacturerRole = artifacts.require("./Manufacturer.sol");
var RetailerRole = artifacts.require("./Retailer.sol");
var ConsumerRole = artifacts.require("./Consumer.sol");
var SupplyChain = artifacts.require("./chain.sol");

module.exports = function(deployer) {
  deployer.deploy(FarmerRole);
  deployer.deploy(DistributorRole);
  deployer.deploy(ManufacturerRole);
  deployer.deploy(RetailerRole);
  deployer.deploy(ConsumerRole);
  deployer.deploy(SupplyChain);
};
