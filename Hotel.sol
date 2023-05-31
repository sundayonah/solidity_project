// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

contract Hotel {
    address payable tenant;
    address payable landlord;

    uint public no_of_rooms = 0;
    uint public no_of_agreement = 0;
    uint public no_of_rent = 0;

    struct Room {
        uint roomId;
        uint agreementId;
        string roomName;
        string roomAddress;
        uint rent_per_month;
        uint securityDeposit;
        uint timestamp;
        bool vacant;
        address payable landlord;
        address payable currentTenant;
    }

    mapping(uint => Room) public Room_by_No;

    struct RoomAgreement {
        uint roomId;
        uint agreementId;
        string roomName;
        string roomAddress;
        uint rent_per_month;
        uint securityDeposit;
        uint lockInPeriod;
        uint timestamp;
        address payable tenantAddress;
        address payable landlordAddress;
    }
    mapping(uint => RoomAgreement) public RoomAgreement_by_No;

    struct Rent {
        uint rentNo;
        uint roomId;
        uint agreementId;
        string roomName;
        string roomAddress;
        uint rent_per_month;
        uint timestamp;
        address payable tenantAddress;
        address payable landlordAddress;
    }

    mapping(uint => Rent) public Rent_bt_No;

    modifier onlyLandlord(uint _index) {
        require(
            msg.sender == Room_by_No[_index].landlord,
            "Only Landlord can access this"
        );
        _;
    }

    modifier notLandLord(uint _index) {
        require(
            msg.sender != Room_by_No[_index].landlord,
            "Only Tenant can access this"
        );
        _;
    }

    modifier OnlyWhileVacant(uint _index) {
        require(
            Room_by_No[_index].vacant == true,
            "Room is Currently Occupied."
        );
        _;
    }

    modifier enoughRent(uint _index) {
        require(
            msg.value >= uint(Room_by_No[_index].rent_per_month),
            "NOt enough Ether in your wallet"
        );
        _;
    }

    modifier enoughAgreement(uint _index) {
        require(
            msg.value >=
                uint(
                    uint(Room_by_No[_index].rent_per_month) +
                        uint(Room_by_No[_index].securityDeposit)
                )
        );
        _;
    }

    modifier AgreemntTimeLeft(uint _index) {
        uint _AgreementNo = Room_by_No[_index].agreementId;
        uint time = RoomAgreement_by_No[_AgreementNo].timestamp +
            RoomAgreement_by_No[_AgreementNo].lockInPeriod;
        require(block.timestamp < time, "Agreement already Ended");
        _;
    }

    modifier AgreementTimesUp(uint _index) {
        uint _AgreementNo = Room_by_No[_index].agreementId;
        uint time = RoomAgreement_by_No[_AgreementNo].timestamp +
            RoomAgreement_by_No[_AgreementNo].lockInPeriod;
        _;
    }

    modifier RentTimesUp(uint _index) {
        uint time = Room_by_No[_index].timestamp + 30 days;
        require(block.timestamp >= time, "Time left to pay Rent");
        _;
    }
}
