//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract MappingsStructExample {

    struct Payment {
        uint timestamp;
        uint amount;
    }

    struct Balance {
        uint numberTime;
        uint totalBalance;
        mapping (uint => Payment) payment;
    }

    mapping (address => Balance) public balanceReceived;

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function sendMoney() public payable {
        Balance storage senderBalance = balanceReceived[msg.sender];
        senderBalance.totalBalance += msg.value;
        Payment memory payment = Payment({timestamp: block.timestamp, amount: msg.value});
        senderBalance.payment[senderBalance.numberTime] = payment;
        senderBalance.numberTime++;
    }

    function getPaymentAt(address _address, uint _index) public view returns (Payment memory payment) {
        return balanceReceived[_address].payment[_index];
    }

    function withdrawAllMoney() public {
        uint amount = balanceReceived[msg.sender].totalBalance;
        address payable receiver = payable(msg.sender);
        balanceReceived[msg.sender].totalBalance = 0;
        receiver.transfer(amount);
    }

    function sendMoneyToAddress(address payable _address, uint _amount) public {
        _address.transfer(_amount * 1 ether);
    }

    function withdrawMoney(uint _amount) public {
        require(_amount <= balanceReceived[msg.sender].totalBalance, "Not sufficient funds");
        address payable receiver = payable(msg.sender);
        balanceReceived[msg.sender].totalBalance -= (_amount * 1 ether);
        receiver.transfer(_amount);
    }
}