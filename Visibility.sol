// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract Base {
    //Private function can only be called inside this contract
    //Contracts that inherit this contract cannot call this function

    function privateFunc() private pure returns (string memory) {
        return "private function Called";
    }

    function testPrivateFunc() public pure returns (string memory) {
        return privateFunc();
    }

    // Internal function can be called
    // inside this contract
    // inside contracts that inherit this contract

    function internalFunc() internal pure returns (string memory) {
        return "Internal function Called";
    }

    function testInternalFunc() public pure virtual returns (string memory) {
        return internalFunc();
    }

    function publicFunc() public pure returns (string memory) {
        return "Public function Called";
    }

    //External functions can only be called by other Contracts
    function externalFunc() external pure returns (string memory) {
        return "external function called";
    }

    //State Variable;
    string private privateVar = "My Private Variable";
    string internal internalVal = "My Internal Variable";
    string public publicVal = "My Public Variable";
}

contract Child is Base {
    //internal function can be called inside child contracts.
    function testInternalFunc() public pure override returns (string memory) {
        return internalFunc();
    }
}
