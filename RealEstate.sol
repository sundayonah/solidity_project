// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol";

contract RealEstate {
    using SafeMath for uint256;

    struct Property {
        uint256 price;
        address owner;
        bool forSale;
        string name;
        string description;
        string location;
    }

    mapping(uint256 => Property) public properties;

    uint256[] public propertyIds;
    event PropertySold(uint256 propertyId);

    function listPropertyForSale(
        uint256 _propertyId,
        uint256 _price,
        string memory _name,
        string memory _description,
        string memory _location
    ) public {
        Property memory newProperty = Property({
            price: _price,
            owner: msg.sender,
            forSale: true,
            name: _name,
            description: _description,
            location: _location 
        });

        properties[_propertyId] = newProperty;
        propertyIds.push(_propertyId);
    }

    /**
     * @dev Buys a property by transferring the ownership and payment to the property owner.
     * @param _propertyId The ID of the property to buy.
     */

    function buyProperty(uint256 _propertyId) public payable {
        Property storage property = properties[_propertyId];

        require(property.forSale, "Property is not for sale");
        require(property.price <= msg.value, "Insuffient Funds");

        property.owner = msg.sender;
        property.forSale = false;

        payabrr
    }
}