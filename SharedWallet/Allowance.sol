//SPDX-License-Identifier: MIT

pragma solidity 0.8.1;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract Allowance is Ownable {
    mapping (address => uint) allowance;

    modifier ownerOrAllowed(uint _amount) {
        require(isOwner() || allowance[msg.sender] >= _amount, "You are not allowed");
        _;
    }

    function isOwner() internal view returns (bool)  {
        return owner() == msg.sender;
    }

    function addAllowance(address _who, uint _amount) public onlyOwner {
        allowance[_who] = _amount;
    }

    function reduceAllowance(address _who, uint _amount) internal ownerOrAllowed (_amount) {
        allowance[_who] -= _amount;
    }
}