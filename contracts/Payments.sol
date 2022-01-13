//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Payments {
  event MoneyDeposited(address indexed sender, uint256 amount);
  event Received(address, uint256);

  mapping(address => uint256) public balances;

  receive() external payable {
    balances[msg.sender] += msg.value;
    emit Received(msg.sender, msg.value);
  }

  function getUserBalance() external view returns (uint256) {
    return balances[msg.sender];
  }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
  
  function withdraw() public {
        balances[msg.sender] = 0;
        // Call returns a boolean value indicating success or failure.
        // This is the current recommended method to use.
        (bool sent,) = msg.sender.call{value: balances[msg.sender]}("");
        require(sent, "Failed to send Ether");
    }
}
