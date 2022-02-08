// SPDX-License-Identifier: MIT 

pragma solidity ^0.7.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/solc-0.7/contracts/math/SafeMath.sol";

contract UpgradedLogic {
    address proxy;
   
    using SafeMath for uint256;
    uint public balanceReceived;

    uint public lockTime;
    
    event AddedSafely(uint256 result);
   
    event Fallback();
    
    function add(uint256 a, uint256 b) external returns (uint256 result) {
        result = a.add(b);
        emit AddedSafely(result);
    }

    function receiveMoney() public payable {
        balanceReceived += msg.value;
        lockTime = block.timestamp + 30 seconds;
    }

    function receiveMoney2() public payable {
        
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function widthrawAll() public {
        if (lockTime < block.timestamp) {
            address payable to = payable(msg.sender);
            to.transfer(getBalance());
        }
    }

    function withdrawTo(address payable _to, uint amount) public {
        require(amount > 0, "Invalid amount!");
        _to.transfer(amount * (1 ether));
    }
    
    fallback() external {
        emit Fallback();
    }
}
