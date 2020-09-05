//SPDX-License-Identifier: MIT
pragma solidity >= 0.5.0 < 0.7.0;

contract Todo {
  constructor() public {
  }

  struct Task{
    uint id;
    uint date;
    string description;
    string author;
    bool isDone;
  }
}
