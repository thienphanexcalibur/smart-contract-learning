//SPDX-License-Idenfitier: MIT

pragma solidity 0.8.4;

contract WillThrow {
    function aFunction() public pure {
        require(false, "Error Message");
    }
}

contract ErrorHandling {
    event LogError(string name);

    function sendError() public {
        WillThrow will = new WillThrow();
        try will.aFunction() {
            
        } catch Error(string memory _e) {
            emit LogError(_e);
        }
    }
}