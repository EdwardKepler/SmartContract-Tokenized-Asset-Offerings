pragma solidity ^0.4.20;
import "./Offering.sol";
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

function NewOffering(uint fundingDuration, uint fundingGoal, string token, uint stake)
public

returns(address OfferingAddress)

{ 
    Offering  trustedOffering = new Offering(fundingDuration,fundingGoal,token,stake);
    OfferingList.push(trustedOffering);
    return trustedOffering;   

}


}
 


