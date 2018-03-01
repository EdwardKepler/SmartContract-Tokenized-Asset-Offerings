pragma solidity ^0.4.20;



contract Owned{
    address public Owner;
    
    modifier OnlyOwner{
    if(msg.sender != Owner) throw;
    _;
}
event LogNewOwner(address Owner, address NewOwner);

function Owned() {
    Owner = msg.sender;
}

function ChangeOwner(address NewOwner)
OnlyOwner
returns(bool success)
{
     require(NewOwner == 0);
     Owner = NewOwner;
     LogNewOwner(Owner,NewOwner);
     return true;
    
}
}
