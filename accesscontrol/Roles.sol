pragma solidity >=0.4.24;

// library for managing addresses assigned to a Role.
// libaries include reusable for other contracts in the blockchain
library Roles {
    struct Role {
        mapping (address => bool) bearer;
    }

    // add the restriction function called in the code below
    function has(Role storage role, address account) internal view returns (bool) {
        return role.bearer[account];
    }

    // give an account access 
    function add(Role storage role, address account) internal {
        // restriction that account has not already access
        require(!has(role, account));
        // assign boolean
        role.bearer[account] = true;
    }

    // remove an account access
    function remove(Role storage role, address account) internal {
       // restriction that account has currently access
       require(has(role, account));
       // assign boolean
       role.bearer[account] == false; 
    }
}