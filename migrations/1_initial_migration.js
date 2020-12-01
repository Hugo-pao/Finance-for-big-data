var Migrations = artifacts.require("Finance-for-big-data/migrations/Migrations.sol");

module.exports = function(deployer) {
  deployer.deploy(Migrations);
};
