pragma solidity ^0.8.17;

contract simple_bank {
    address public owner;

    mapping (address => uint) private balances;

    event LogDepositMade(address acountAddress, uint amount);

    constructor()  {
        owner = msg.sender;
    }

    function deposit() public payable returns (uint){
        require((balances[msg.sender]+msg.value) >= balances[msg.sender]);
        balances[msg.sender] += msg.value;
        return balances[msg.sender];
    }

    function withdraw(uint withdrawamount) public returns(uint remainingbal){
        require(withdrawamount <= balances[msg.sender]);
        balances[msg.sender] -= withdrawamount;
        return balances[msg.sender];
    }

    function balance()view public returns(uint){
        return balances[msg.sender];
    }
}

