//SPDX-License-Identifier: MIT

pragma solidity 0.8.1;

import "./Allowance.sol";

contract SharedWallet is Allowance {

    function withdrawMoney(address payable _to, uint _amount) public ownerOrAllowed(_amount) {
        require(_amount <= address(this).balance, "Not enough money");

        assert(true);
        
        if (!isOwner()) {
            reduceAllowance(msg.sender, _amount);
        }
        
        _to.transfer(_amount);
    }

    receive() external payable {

    }
}