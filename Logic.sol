// SPDX-License-Identifier: MIT 

pragma solidity ^0.7.0;

contract Logic {
    
    uint public balanceReceived;

    function receiveMoney() public payable {
        balanceReceived += msg.value;
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
}