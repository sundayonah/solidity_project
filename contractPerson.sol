// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract contractPerson {
    uint256 public peopleCount = 0;
    mapping(uint => Person) public people;

    address owner;

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    struct Person {
        uint256 _id;
        string _firstName;
        string _lastName;
    }

    constructor() {
        owner = msg.sender;
    }

    function addPerson(
        string memory _firstName,
        string memory _lastName
    ) public onlyOwner {
        increament();
        people[peopleCount] = Person(peopleCount, _firstName, _lastName);
    }

    function increament() internal {
        peopleCount += 1;
    }
}
