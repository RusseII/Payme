//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Payments {
  event MoneyDeposited(address indexed sender, uint256 amount);
  event Received(address, uint256);

  mapping(address => uint256) public balances;

  receive() external payable {
    balances[msg.sender] += msg.value;
    emit Received(msg.sender, msg.value);
  }

  function getBalance() external view returns (uint256) {
    return balances[msg.sender];
  }
}
