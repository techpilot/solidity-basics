// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

contract MyContract {
    // state variable
    string public myString = "up";
    bytes32 public myBytes = "up";
    int public myInt = 1;
    uint public myUint = 1;
    uint8 public myUint8 = 1;
    address public myAddress = msg.sender;

    struct MyStruct {
        uint id;
        string name;
    }

    MyStruct public myStruct = MyStruct(1, "Daniel");

    // local variable
    function getValue() public pure returns(uint) {
        uint value = 1;
        return value;
    }
}