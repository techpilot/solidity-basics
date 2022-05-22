 // SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

contract HotelRoom {
    // keeps track of the collection of options
    enum Statuses { Vacant, Occupied }
    Statuses currentStatus;

    // an address payable - accepts payment
    address public owner;

    event Occupy(address _occupant, uint _value);

    constructor() {
        owner = msg.sender;
        currentStatus = Statuses.Vacant;
    }

    // modifiers, creating a reusable conditions
    modifier onlyWhileVacant {
        // checks if the room is currently occupied
        require(currentStatus == Statuses.Vacant, "Currently occupied.");
        _;
    }

    modifier costs (uint _amount) {
        // check price
        require(msg.value >= _amount, "Not enough ether provided.");
        _;
    }

    // special function that receives Ether payment, external makes it called as a smart contract
    receive() external payable onlyWhileVacant costs(2 ether) {
        payable(owner).transfer(msg.value);
        currentStatus = Statuses.Occupied;
        emit Occupy(msg.sender, msg.value);
    }
}