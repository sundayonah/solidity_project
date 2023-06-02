// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract ERC20Token {
    string public name;
    mapping(address => uint256) public balances;

    function mint() public {
        balances[tx.origin]++;
        // balances[msg.sender]++;
    }
}

contract BuyToken {
    address payable wallet;
    address public token;

    constructor(address payable _wallet, address _token) {
        wallet = _wallet;
        token = _token;
    }

    receive() external payable {}

    fallback() external payable {
        buyToken();
    }

    function buyToken() public payable {
        ERC20Token(address(token)).mint();
        wallet.transfer(msg.value);
    }
}
