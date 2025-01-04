// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PingPong {
    string public message;
    uint supply;

    function ping(string memory _message, uint _supply) public  {
        message = _message;
        supply = _supply;
    }

    function pong() public view returns(string memory, uint){
        return (message, supply);
    }

    // deployed https://sepolia.etherscan.io/address/0x85f2a820e791be03955f516a939530dbf4d84e70#code
}