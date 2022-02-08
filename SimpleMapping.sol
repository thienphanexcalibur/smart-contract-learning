//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract SimplMapping {
    mapping (uint => bool) public myMapping;
    mapping (address => bool) public myAddressMapping;
    mapping (uint => mapping (uint => bool)) public specialMapping;

    function setValue(uint _value) public {
        myMapping[_value] = true;
    }
    
    function setSpecialValue(uint _value1, uint _value2) public {
        specialMapping[_value1][_value2] = true;
    }

    function setMyAddressToTrue() public {
        myAddressMapping[msg.sender] = true;
    }
}