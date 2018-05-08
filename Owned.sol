pragma solidity ^0.4.20;

// 

contract Owned {
    address public owner=0x4b0897b0513fdc7c541b6d9d7e929c4e5364d2db;
    modifier OnlyOwner{
    if(msg.sender != owner) throw;
    _;
}


function ChangeOwner (address newOwner)
public
OnlyOwner 
returns(bool success)
{
     if(newOwner == 0) throw;
     owner =  newOwner;

     return true;
    
}
}
