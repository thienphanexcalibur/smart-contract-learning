// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.0;

contract TestAddress {
    address public myAddress;

    function setAddress(address _address) public {
        myAddress = _address;
    }

    function getBalance() public view returns (uint) {
        return myAddress.balance;
    }
}