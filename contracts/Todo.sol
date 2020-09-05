//SPDX-License-Identifier: MIT
pragma solidity >= 0.5.0 < 0.7.0;

contract Todo {
  constructor() public {
    lastTaskId = 0;
  }

  struct Task{
    uint id;
    uint date;
    string description;
    string author;
    bool isDone;
  }

  uint[] taskIds;
  uint lastTaskId;
  mapping(uint => Task) tasks;

  // events
  event TaskCreated(uint, uint, string, string, bool);

  function createTask(string memory _description, string memory _author) public {
    lastTaskId++; 
    tasks[lastTaskId] = Task(lastTaskId, now, _description, _author, false);
    taskIds.push(lastTaskId);
    emit TaskCreated(lastTaskId, now, _description, _author, false);
  }

  function getTask(uint id) public view checkIfTaskIdExists(id) returns (
    uint,
    uint,
    string memory,
    string memory,
    bool
  ) {
    return (id, tasks[id].date, tasks[id].description, tasks[id].author, tasks[id].isDone);
  } 

  function getTaskIds() public view returns(uint[] memory) {
    return taskIds;
  }

  modifier checkIfTaskIdExists(uint id) {
    if(id == 0){
      revert('task id is invalid');
    }
    _;
  }
}
