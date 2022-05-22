// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

contract ArrContract {
    // type[] public/private variable
    uint[] public uintArr = [1,2,3];
    string[] public values;
    uint[][] public arr2D = [[1,2,3], [4,5,6]];

    function addValue(string memory _value) public {
        values.push(_value);
    }

    function valueCount() public view returns(uint) {
        return values.length;
    }
}