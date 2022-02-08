// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract TestOverflow {
    uint8 public myUint8 = 255;

    function decrement() public {
        unchecked {
            myUint8--;
        }
    }

    function increment() public {
        myUint8++;
    }
}