contract Lunch {
  address public organizer;
  mapping (address => bool) public attendeeJoined;
  uint public numOfAttendee;
  uint public limit;
  uint public totalCost;

  function Lunch() {
    organizer = msg.sender;
    limit = 10;
    numOfAttendee = 0;
    totalCost = 100;
  }

  function changeTotalCost(uint newTotalCost) public {
    if (msg.sender != organizer) { return; }
    totalCost = newTotalCost;
  }

  function getAvailable() public returns (uint) {
    return limit - numOfAttendee;
  }

  function attend() public payable returns (bool) {
    if (numOfAttendee >= limit) { return false; }
    attendeeJoined[msg.sender] = true;
    numOfAttendee++;
    return true;
  }

  function checkAttendance(address people) public returns (bool) {
    return attendeeJoined[people];
  }

  function splitCost() public returns (uint) {
    return totalCost / numOfAttendee;
  }

  function kill() {
    if (msg.sender == organizer) {
      suicide(organizer);
    }
  }

}
