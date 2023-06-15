// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Faucet {
  address[] public funders;

  receive() external payable {}

  function addFunds() external payable {
    funders.push(msg.sender);
  }

  function getAllFunders () external view returns (address[] memory) {
    return funders;
  }

  function withdraw(uint withdrawAmount) external{
    payable(msg.sender).transfer(withdrawAmount);
  }
}

//const instance = await Faucet.deployed()
// instance.addFunds({value: "200000000000000", from: accounts[1]}
// 200000000000000000000000000000000
// 0xa0b8de46875d72c3d8781f59b224894813a03c4b37f2cd19fa6e22afe620105b
// 0xa0b8de46875d72c3d8781f59b224894800000000000000000000000000000000
// 818E818E10000000 * 0000000000000000

// 818E FB3509aA 9FBe 95aB == 110000009FBe95aB
// 0x818EFB3509aA9FB9e5aBD9325a3fb568 1100000000003b13