pragma solidity 0.5.0;
pragma experimental ABIEncoderV2;
contract Todo{

event TaskEvent(uint  , uint , string, string , bool );
struct Task{
    uint id ;
    uint date ; 
    string content;
    string author;
    bool done;
}
    uint lastTaskId ;
    uint[] taskId;
    mapping(uint => Task) tasks;

    constructor() public{
        lastTaskId = 0;
    }

    modifier taskExist(uint id){
        if(tasks[id].id == 0){
            revert();
        }
        _;
    }

    function createTask(string memory _content , string  memory _author) public{
           lastTaskId++;
            Task memory task  = Task({
                id : lastTaskId,
                date : now,
                content : _content,
                author : _author,
                done : false
            });

            tasks[lastTaskId] = task ;
            taskId.push(lastTaskId);
            emit TaskEvent(lastTaskId, now, _content, _author, false);
    }

    function getTask(uint id) taskExist(id) public view returns(uint ,uint ,string memory , string memory , bool) {
        
        
        return(id , tasks[id].date , tasks[id].content,tasks[id].author,tasks[id].done);
    }

    function getTaskId() public view returns(uint[] memory){
        return taskId;
    }

}
  
