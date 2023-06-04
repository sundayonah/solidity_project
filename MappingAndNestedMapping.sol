// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

//MAPPING
contract Mapping {
    // using SafeMath for uint256;

    //Mapping from address to uint
    mapping(address => uint) public myMap;

    function get(address _addr) public view returns (uint) {
        //Mapping always returns a value.
        //If the value was never set, it will return the default value.
        return myMap[_addr];
    }

    function set(address _addr, uint _i) public payable {
        //Update the value at this address.
        myMap[_addr] = _i;
    }

    function remove(address _addr) public {
        //Reset the value to te default value.
        delete myMap[_addr];
    }
}

//NESTED MAPPING
contract NestedMapping {
    //Nested Mapping (mapping from address to another mapping)
    mapping(address => mapping(uint => bool)) public Nested;

    function get(address _addr1, uint _i) public view returns (bool) {
        //You can get values from a nested mapping
        //even when it is not initialized.
        return Nested[_addr1][_i];
    }

    function set(address _addr1, uint _i, bool _bool) public payable {
        Nested[_addr1][_i] = _bool;
    }

    function remove(address _addr1, uint _i) public {
        delete Nested[_addr1][_i];
    }
}
