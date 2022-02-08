// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.1;

contract StartStopUpdateExample {
    address public owner;
    bool public paused = false;

    constructor() {
        owner = msg.sender;
    }
    function sendMoney() public payable {

    }

    function setPaused(bool _value) public {
        paused = _value;
    }

    function withdrawAllMoney(address payable _to) public {
        require(msg.sender == owner, "You are not owner");
        require(paused == false, "Smart contract is paused");
        _to.transfer(address(this).balance);
    }

    function destroySmartContract(address payable _to) public {
        require(msg.sender == owner, "You are not the owner");
        selfdestruct(_to);
    }
}