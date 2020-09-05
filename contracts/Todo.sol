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
    uint dateCompleted;
    bool isDone;
  }

  uint[] taskIds;
  uint lastTaskId;
  mapping(uint => Task) tasks;

  // events
  event TaskCreated(uint, uint, string, string, uint, bool);
  event ToggleTaskStatus(uint, uint, bool);

  function createTask(string memory _description, string memory _author) public {
    lastTaskId++; 
    tasks[lastTaskId] = Task(lastTaskId, now, _description, _author, 0, false);
    taskIds.push(lastTaskId);
    emit TaskCreated(lastTaskId, now, _description, _author, 0, false);
  }

  function getTask(uint _id) checkIfTaskIdExists(_id) public view returns (
    uint,
    uint,
    string memory,
    string memory,
    uint,
    bool
  ) {
    return (_id, tasks[_id].date, tasks[_id].description, tasks[_id].author, tasks[_id].dateCompleted, tasks[_id].isDone);
  } 

  function getTaskIds() public view returns(uint[] memory) {
    return taskIds;
  }

  function toggleTask(uint _id) checkIfTaskIdExists(_id) public {
    Task storage task = tasks[_id];
    task.isDone = true;
    task.dateCompleted = task.isDone ? now : 0;
    emit ToggleTaskStatus(_id, task.dateCompleted, task.isDone);
  }

  modifier checkIfTaskIdExists(uint id) {
    if(id == 0){
      revert('task id is invalid');
    }
    _;
  }
}
