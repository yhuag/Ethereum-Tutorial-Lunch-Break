var Custodian = artifacts.require("./Custodian.sol");
var Child = artifacts.require("./Child.sol");

module.exports = function(deployer) {
  deployer.deploy(Custodian);
  deployer.deploy(Child);
};
