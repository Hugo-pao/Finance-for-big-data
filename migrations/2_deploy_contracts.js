var SupplyChain = artifacts.require("SupplyChain");
module.exports = function(deployer) {
    deployer.deploy(SupplyChain);
    // Additional contracts can be deployed here
};