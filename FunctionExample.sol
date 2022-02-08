//SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract FunctionExample {
    address payable owner;
    mapping(address => uint64) public balanceReceived;

    constructor() {
        owner = payable(msg.sender);
    }

    function destroySmartContract() public {
        require(msg.sender == owner, "You are not the owner");
        selfdestruct(owner);
    }

    function getOwner() public view returns (address) {
        return owner;
    }

    function convertWeiToEth(uint _amount) public pure returns(uint) {
        return _amount / 1 ether;
    }

    function receiveMoney() public payable {

        assert(msg.value == uint64(msg.value));
        balanceReceived[msg.sender] += uint64(msg.value);
    }

    function withdrawMoney(address payable _to, uint64 _amount) public {
        require(_amount <= balanceReceived[msg.sender], "Not Enough Funds, aborting");

        assert(balanceReceived[msg.sender] >= balanceReceived[msg.sender] - _amount);

        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

     receive() external payable {
        receiveMoney();
    }
}
