// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.4.24;

// Import the library 'Roles'
import "./Roles.sol";

// Define a contract 'ManufacturerRole' to manage this role - add, remove, check
contract ManufacturerRole{
  using Roles for Roles.Role;
  // Define 2 events, one for Adding, and other for Removing
  event ManufacturerAdded(address indexed account);
  event ManufacturerRemoved(address indexed account);

  // Define a struct 'manufacturers' by inheriting from 'Roles' library, struct Role
  Roles.Role private manufacturers;

  // In the constructor make the address that deploys this contract the 1st consumer
  constructor() public {
    _addManufacturer(msg.sender);
  }

  // Define a modifier that checks to see if msg.sender has the appropriate role
  modifier onlyManufacturer() {
    require(isManufacturer(msg.sender));
    _;
  }

  // Define a function 'isManufacturer' to check this role
  function isManufacturer(address account) public view returns (bool) { // What's the meaning of public func calling the int ones?
    return manufacturers.has(account);
  }

  // Define a function 'addManufacturer' that adds this role
  function addManufacturer(address account) public onlyManufacturer {
    _addManufacturer(account);
  }

  // Define a function 'renounceManufacturer' to renounce this role
  function renounceManufacturer(address account) public {
    _removeManufacturer(account);
  }

  // Define an internal function '_addManufacturer' to add this role, called by 'addManufacturer'
  function _addManufacturer(address account) internal {
    manufacturers.add(account);
    emit ManufacturerAdded(account);
  }

  // Define an internal function '_removeManufacturer' to remove this role, called by 'removeManufacturer'
  function _removeManufacturer(address account) internal {
    manufacturers.remove(account);
    emit ManufacturerRemoved(account);
  }

}