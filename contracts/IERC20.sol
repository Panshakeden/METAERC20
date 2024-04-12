// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

interface IERC20{
  function transfer(address _to, uint256 _value) external returns (bool success);

  function mint(address _to, uint256 _value) external;

  function burn(uint256 _value) external;

  event Transfer(address sender, address recipient, uint256 value);
}