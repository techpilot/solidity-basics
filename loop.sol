// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

contract Loop {
    uint[] public numbers = [1,2,3,4,5,6,7,8,9,10];

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    // counts and returns the number of even numbers in an  array
    function countEvenNumbers() public view returns(uint) {
        uint count = 0;
        for(uint i = 0; i < numbers.length; i++) {
            if (isEvenNumber(numbers[i])) {
                count ++;
            }
        }

        return count;
    }

    // returns a boolean, whether a number is even or not
    function isEvenNumber(uint _number) public pure returns(bool) {
        if (_number % 2 == 0) {
            return true;
        } else {
            return false;
        }
    }

    // checks if the creator == deployers
    function isOwner() public view returns(bool) {
        return(msg.sender == owner);
    }
}