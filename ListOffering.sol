pragma solidity ^0.4.20;
import "./TRO-Offering.sol";
import "./Listing.sol";




contract ListOffering is Listing{
  address[] public OfferingList;

  

function OfferingListCount()
    public
    constant
    returns(uint ListCount)
    {
        return OfferingList.length;
    
    }




function NewOffering(uint fundingDuration, uint fundingGoal , string Token)
public

returns(address OfferingAddress)

{  
