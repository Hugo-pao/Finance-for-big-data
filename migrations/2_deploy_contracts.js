// migrating the appropriate contracts

// wie heissen die files? FarmerRole.sol oder Farmer.sol?

var FarmerRole = artifacts.require("./FarmerRole.sol");
var DistributorRole = artifacts.require("./DistributorRole.sol");
var ManufacturerRole = artifacts.require("./ManufacturerRole.sol");
var RetailerRole = artifacts.require("./RetailerRole.sol");
var ConsumerRole = artifacts.require("./ConsumerRole.sol");
var SupplyChain = artifacts.require("./SupplyChain.sol"); //heisst die einfach chain.sol ?

module.exports = function(deployer) {
  deployer.deploy(FarmerRole);
  deployer.deploy(DistributorRole);
  deployer.deploy(ManufacturerRole);
  deployer.deploy(RetailerRole);
  deployer.deploy(ConsumerRole);
  deployer.deploy(SupplyChain);
};
