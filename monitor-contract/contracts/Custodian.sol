pragma solidity ^0.4.13;

import "./Child.sol";

contract Custodian {
  uint public counter;

  event Birth(uint _counter, address _child);

  function Monitor() public {
    counter = 0;
  }

  function createChild() public returns (address) {
    ++counter;
    Child child = new Child();
    Birth(counter, child);
    return child;
  }

}
