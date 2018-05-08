pragma solidity ^0.4.20;
import "./Listing.sol";
import "./Owned.sol";

    contract Offering is Owned{
    // Smart Contract For Tokenized Asset Offerings -TAO Foundation [Edward Kepler]
    // Smart Contract For Tokenized Research Offering [TRO]
    // Offering Address   0xca35b7d915458ef540ade6068dfe2f44e8fa733c
    address public offering;
    uint    public duration;
    uint    public goal;
    
    uint    public fundsRaised;
    bool    public refundSent;
    bool    public tokenHolder;
    string  public token1;
    uint public stake;
    
	//"TokenizedLResearchOffering": {
	//	"OfferingType": "TSO”,
	//	"OfferingAddress": "0xca35b7d915458ef540ade6068dfe2f44e8fa733c",
	//	"ResearchType": "Cancer Treatments using Canna",
	//	"ServiceName": "Cancer Canna",
	//	"ServiceDescription": "Cancer Research",
	//	"Date": "2/23/2018",
	//	"Length": "3 years",
	//	"Location": "Maimi Florida",
	//	"Materials": "www.nm.org",
	//	"ServiceProviders": {
	//		"ServiceProvider": "Edward Kepler"
	//	},
	//	"SoftCap": "500,000",
	//	"HardCap": "10,000,000",
	//	"PrePrice": "2,000",
	//	"NumberOfToken": "5000000",
	//	"Accepting": "Bitcoin,Litecoin",
	//  "Platform": "Ethereum",
	//  "Restricted": "NA",
	//  "Infolink": "NA",
    //  "Videolink": "NA",
    //  "Publication:"NA";
    //  "Sponsor": "Red Cross",
    //  "Matching": "100%",
    //		}
	//}
//}"
    
    
    struct FunderStruct {
    address funder;
    uint    amount;
    }
    FunderStruct[] funderStructs;
      modifier onlyOwner {
      require(msg.sender == offering);
      _;
       }
           // [TAO] Tokenized Asset Offering 
           // [TRO] Tokenized Research Offering
           // Tokenized - [TAO,TBO,TCO,TDO,TEO,TGO,TKO,TLO,TMO,TPO,TRO,TSO,TTO]
           
          
    function fundingSuccessful() public constant returns(bool isSuccess){
    return(fundsRaised >= goal);
    }
    function fundingFailed() public constant returns(bool isFailed){
    return(fundsRaised < goal && block.number > duration);
    }
          
    event LogContribution(address sender, uint amount);
    event LogWithdrawl(address funder , uint amount);
    event LogRefund(address sender , uint amount);
    event LogFoundation(address foundation , uint fundingFee);
    
    function Offering(uint _fundingDuration,uint _fundingGoal, string _token, uint _stake) public payable{
    //Create Offering
    offering = 0xca35b7d915458ef540ade6068dfe2f44e8fa733c;
    owner = Owned.owner;
    token1 = _token;
    duration = block.number + _fundingDuration;
    goal = _fundingGoal;
    stake = _stake;
    }
    
    function contribute() public payable returns(bool success){
     //Contribute To Offering
     if(msg.value==0) throw;
     if(fundingSuccessful()) throw;
     if(fundingFailed()) throw;
     fundsRaised +=msg.value;
     FunderStruct memory newFunder;
     newFunder.funder = msg.sender;
     newFunder.amount = msg.value;
     funderStructs.push(newFunder);
     LogContribution(msg.sender, msg.value);
     return true;
    
     }

   function withdrawlFees() public payable returns(bool success)
   {
   //withdrawFees - Owner Only 
   uint foundationFee;
   uint fundingAmount;
   uint finalAmount;
   if(msg.sender != owner) throw;
   if(!fundingSuccessful()) throw;
   if(tokenHolder == true)
   {
   fundingAmount = this.balance;    
   foundationFee = (fundingAmount * 5)/100;
   finalAmount = (fundingAmount - foundationFee);
   owner.transfer(foundationFee);
   LogFoundation(owner,foundationFee);
   return true;
   }
   fundingAmount = this.balance;    
   foundationFee = (fundingAmount * 10)/100;
   finalAmount = (fundingAmount - foundationFee);
   owner.transfer(foundationFee);
   LogFoundation(owner,foundationFee);
   return true;
   }

 
   function withdrawFunds() public payable returns(bool success){
   // WithdrawFunds - Offering Originator Only
   uint fundingAmount;
   if(msg.sender != offering) throw;
   if(!fundingSuccessful()) throw;
   fundingAmount = this.balance;
   offering.transfer(fundingAmount);
   LogFoundation(offering,fundingAmount);
   return true;
   }
   

   
   
    
   
   
 

   
}
