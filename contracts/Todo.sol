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

  Task[] public tasks;

  function createTask(string memory _description, string memory _author) public {
    tasks.push(Task(tasks.length, now, _description, _author, false));
  }

  function getTask(uint id) public view returns (
    uint,
    uint,
    string memory,
    string memory,
    bool
  ) {
    return (id, tasks[id].date, tasks[id].description, tasks[id].author, tasks[id].isDone);
  }

  function 
}
