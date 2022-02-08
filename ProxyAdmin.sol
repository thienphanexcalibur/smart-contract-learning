// SPDX-License-Identifier: MIT 

pragma solidity ^0.7.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.4.0/contracts/access/Ownable.sol";
import "./TransparentUpgradableProxy.sol";

contract ProxyAdmin is Ownable {
    
    function getProxyImplementation(TransparentUpgradableProxy proxy) public view returns (address) {
        // bytes4(keccak256("implementation()")) == 0x5c60da1b
        (bool success, bytes memory returnData) = address(proxy).staticcall(hex"5c60da1b");
        require(success);
        return abi.decode(returnData, (address));
    }
    
    function getProxyAdmin(TransparentUpgradableProxy proxy) public view returns (address) {
        // bytes4(keccak256("admin()")) == 0xf851a440
        (bool success, bytes memory returnData) = address(proxy).staticcall(hex"f851a440");
        require(success);
        return abi.decode(returnData, (address));
    }
    
    function changeProxyAdmin(TransparentUpgradableProxy proxy, address newAdmin) public virtual onlyOwner {
        proxy.changeAdmin(newAdmin);
    }
    
    function upgrade(TransparentUpgradableProxy proxy, address implementation) public virtual onlyOwner {
        proxy.upgradeTo(implementation);
    }
}