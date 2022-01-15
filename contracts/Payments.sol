//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "@rari-capital/solmate/src/utils/SafeTransferLib.sol";
import "hardhat/console.sol";

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

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function withdraw() public {
        uint256 share = balances[msg.sender];
        balances[msg.sender] = 0;
        SafeTransferLib.safeTransferETH(msg.sender, share);
    }
}
