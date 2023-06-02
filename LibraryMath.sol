// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import "./SafeMath.sol";

contract MyLibrary {
    using SafeMath for uint256;
    uint256 public value;

    function calculate(uint _value1, uint _value2) public {
        value = _value1.div(_value2);
    }
}
