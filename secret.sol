 // SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

contract Ownable {
    address owner; 

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Permission denied");
        _;
    }
}

contract SecretVault {
    string secret;

    constructor(string memory _secret) {
        secret = _secret;
    }

    function getScret () public view returns(string memory) {
        return secret;
    }
}

// Inheriting from Ownable contract
contract Secret is Ownable {
    address secretVault;

    constructor(string memory _secret) {
        SecretVault _secretVault =  new SecretVault(_secret);
        secretVault = address(_secretVault);
        super;
    }

    function getScret () public view onlyOwner returns(string memory) {
        SecretVault _secretVault = SecretVault(secretVault);
        return _secretVault.getScret();
    }
}