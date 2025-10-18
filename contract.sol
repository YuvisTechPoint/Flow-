// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Counter {
    uint256 public count;
    address public owner;

    event CountedTo(uint256 newCount, address indexed by);

    constructor(uint256 _start) {
        count = _start;
        owner = msg.sender;
    }

    function increment() public {
        count += 1;
        emit CountedTo(count, msg.sender);
    }

    function decrement() public {
        require(count > 0, "count zero");
        count -= 1;
        emit CountedTo(count, msg.sender);
    }

    function set(uint256 _v) public {
        require(msg.sender == owner, "owner only");
        count = _v;
        emit CountedTo(count, msg.sender);
    }
}
