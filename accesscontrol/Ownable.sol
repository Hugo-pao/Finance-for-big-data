// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.4.24;

// basic authorization control 
contract Ownable{
    address private origOwner; 

    // Event (stored in transaction logs)
    event TransferOwnership(address indexed oldOwner, address indexed newOwner);

    // Assign the contract to an owner
    constructor () public {
        origOwner = msg.sender;
        // For front-end
        emit TransferOwnership(address(0), origOwner); //old owner is no-one -> address(0) solidity standard
    }

    // Look up the address
    function ownerLookup() public view returns (address) {
        return origOwner;
    }

    // Check if the calling address is the owner of the contract
    function isOwner() public view returns (bool) {
        return msg.sender == origOwner;
    }

    // Define a function modifier 'onlyOwner'
    modifier onlyOwner() {
        require(isOwner());
        _;
    }

    // Define a function to renounce ownerhip
    function renounceOwnership() public onlyOwner {
        // For front-end
        emit TransferOwnership(origOwner, address(0));
        origOwner = address(0);
    }

    // Define an internal function to transfer ownership
    function _transferOwnership(address newOwner) internal {
        require(newOwner != address(0));
        emit TransferOwnership(origOwner, newOwner);
        origOwner = newOwner;
    }

    // Define a public function to transfer ownership
    function transferOwnership(address newOwner) public onlyOwner {
        _transferOwnership(newOwner);
    }

}
