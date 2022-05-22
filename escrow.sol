 // SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

contract Escrow {
    address agent;

    mapping(address => uint) public deposits;

    modifier onlyAgent() {
        require(msg.sender == agent);
        _;
    }

    constructor() {
        agent = msg.sender;
    }

    // deposit funds into the escrow account
    // accepts an address that receives the funds, and increments the payee's acct by the amount
    function deposit(address payee) public onlyAgent payable {
        uint amount = msg.value;
        deposits[payee] = deposits[payee] + amount;
    }

    // withdraws the funds into the payee address
    function withdraw(address payee) public onlyAgent {
        uint payment = deposits[payee];
        deposits[payee] = 0;
        payable(payee).transfer(payment);
    }
}