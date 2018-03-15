pragma solidity ^0.4.20;
import "./Listing.sol";
import "./TRO-Offering.sol";
import "./Currated.sol";


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
    Offering trustedOffering = new Offering(fundingDuration,fundingGoal,Token);
    OfferingList.push(trustedOffering);
    return trustedOffering;
}

function NewCurrated(uint fundingDuration, uint fundingGoal , string Token)
public

returns(address CurratedAddress)

{ 
    Offering  curratedOffering = new Offering(fundingDuration,fundingGoal,Token);
    OfferingList.push(curratedOffering);
    return curratedOffering;
}

}


