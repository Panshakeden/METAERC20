// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;


interface IERC20 {

    function balanceOf(address _owner) external view returns (uint256 balance);

    function transfer(address _to, uint256 _value) external returns (bool success);

    function mint(address _account, uint256 _amount) external;

    function burn(uint96 _amount) external;

    event Transfer(address sender, address recipient, uint256 value);
}