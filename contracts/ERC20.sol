// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;


contract ERC20T {

    
    uint256 public totalSupply;
    address public owner;

    mapping(address => uint256) balances;

    constructor(
       
    ) {
        owner = msg.sender;
    }

    function onlyOwner() private view {
        require(owner == msg.sender, "you are not the owner");
    }

    function mint(address _account, uint256 _amount) external {
        onlyOwner();
        require(_amount > 0);

        totalSupply = totalSupply + _amount;
        balances[_account] += _amount;
    }

    function transfer(address _to, uint256 _value) external returns (bool) {
        require(msg.sender != address(0), "Address 0 not allowed");
        require(totalSupply >= balances[msg.sender]);

        uint256 Bal = balances[msg.sender];
        require(Bal >= _value);

        balances[msg.sender] = Bal - _value;
        balances[_to]  += _value;

        assert(balances[msg.sender] == (Bal - _value));

        return true;
    }

    function burn(uint96 _amount) external {
        require(msg.sender != address(0), "Address 0 not allowed");
        require(balances[msg.sender] > 0);
        require(balances[msg.sender] >= _amount);
        
        balances[msg.sender] -= _amount;
        totalSupply -= _amount;

        balances[address(0)] += _amount;
    }

    function balanceOf(address _owner) external view returns (uint256) {
        return balances[_owner];
    }


    // 0x0000000000000000000000000000000000000000
}
