// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract ERC20Token {
    string public name; // Public variable to store the name of the token
    mapping(address => uint256) public balances; // Mapping to store token balances of addresses

    constructor(string memory _name) {
        name = _name; // Initialize the token name in the constructor
    }

    function mint() public virtual {
        balances[tx.origin]++; // Mint new tokens and assign them to the transaction sender
        // balances[msg.sender]++; // Alternative approach to assign tokens to the message sender
    }
}

contract MyToken is ERC20Token {
    string public symbol; // Public variable to store the symbol of the token
    address[] public owners; // Dynamic array to keep track of token owners
    uint256 ownerCount; // Counter for the number of token owners

    constructor(
        string memory _name,
        string memory _symbol
    )
        ERC20Token(_name) // Invoke the constructor of the base ERC20Token contract
    {
        symbol = _symbol; // Initialize the token symbol in the constructor
    }

    function mint() public virtual override {
        super.mint(); // Call the mint function of the base ERC20Token contract
        ownerCount++; // Increment the owner count
        owners.push(msg.sender); // Add the message sender to the owners array
    }
}
