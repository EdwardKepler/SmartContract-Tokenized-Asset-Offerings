pragma solidity ^0.4.20;
import "./Listing.sol";
import "./Owned.sol";

    contract Offering is Owned\{\
    // Smart Contract For Tokenized Asset Offerings -TAO Foundation [Edward Kepler]\
    // Smart Contract For Tokenized Museum Offering [TMO]\
    // Offering Address   0xca35b7d915458ef540ade6068dfe2f44e8fa733c\
    address public offering;\
    uint    public duration;\
    uint    public goal;\
    \
    uint    public fundsRaised;\
    bool    public refundSent;\
    bool    public tokenHolder;\
    string  public token1;\
    uint public stake;\
    \
	//"TokenizedMuseumOffering": \{\
	//	"OfferingType": "TGO\'94,\
	//	"OfferingAddress": "0xca35b7d915458ef540ade6068dfe2f44e8fa733c",\
	//	"Artist": "Lambo Van Gough",\
	//	"ArtworkName": "Crypto Cafe",\
	//	"Dimension": "20\'92\'92 X 30\'92\'92",\
	//	"Period": "Modern",\
	//	"Created": "4/23/2018",\
	//	"PhotosOfArtwork": "www.nm.org",\
	//	"AssetOwners": \{\
	//		"AssetOwner": "Edward Kepler"\
	//	\},\
	//	"ProvernanceName": "James Lilly",\
	//	"ProvernanceDate": "01/23/2018",\
	//	"CertificateOfOwnership": " www.iiio.com",\
	//	"CertificateOfAuthenticity": "www.iiio.com",\
	//	"Tokenization": "TAO",\
	//	"EstimateOfArtworkValuation": "$500,000",\
	//	"PercentageForTokenization": "20%",\
	//	"FundraisingTarget": "$100,000",\
	//	"SettlementDate": "5/23/2018",\
	//	"Rollover": "Yes",\
	//	"ExitOption": "NA",\
	//	"FundingPlan": "NA",\
	//	"PersonalInformation": \{\
	//		"FirstName": "Edward",\
	//		"LastName": "Kepler",\
	//		"DateOfBirth": "03/24/1966",\
	//		"RelationToAsset": "Owner",\
	//		"MobilePhone": "612-802-4543",\
	//		"Email": "ekepler@gmail.com"\
    //		\}\
	//\}\
//\}"\
    \
    \
    struct FunderStruct \{\
    address funder;\
    uint    amount;\
    \}\
    FunderStruct[] funderStructs;\
      modifier onlyOwner \{\
      require(msg.sender == offering);\
      _;\
       \}\
           // [TAO] Tokenized Asset Offering \
           // [TRO] Tokenized Museum Offering\
           // Tokenized - [TAO,TBO,TCO,TDO,TEO,TGO,TKO,TLO,TMO,TPO,TRO,TSO,TTO]\
           \
          \
    function fundingSuccessful() public constant returns(bool isSuccess)\{\
    return(fundsRaised >= goal);\
    \}\
    function fundingFailed() public constant returns(bool isFailed)\{\
    return(fundsRaised < goal && block.number > duration);\
    \}\
          \
    event LogContribution(address sender, uint amount);\
    event LogWithdrawl(address funder , uint amount);\
    event LogRefund(address sender , uint amount);\
    event LogFoundation(address foundation , uint fundingFee);\
    \
    function Offering(uint _fundingDuration,uint _fundingGoal, string _token, uint _stake) public payable\{\
    //Create Offering\
    offering = 0xca35b7d915458ef540ade6068dfe2f44e8fa733c;\
    owner = Owned.owner;\
    token1 = _token;\
    duration = block.number + _fundingDuration;\
    goal = _fundingGoal;\
    stake = _stake;\
    \}\
    \
    function contribute() public payable returns(bool success)\{\
     //Contribute To Offering\
     if(msg.value==0) throw;\
     if(fundingSuccessful()) throw;\
     if(fundingFailed()) throw;\
     fundsRaised +=msg.value;\
     FunderStruct memory newFunder;\
     newFunder.funder = msg.sender;\
     newFunder.amount = msg.value;\
     funderStructs.push(newFunder);\
     LogContribution(msg.sender, msg.value);\
     return true;\
    \
     \}\
\
   function withdrawlFees() public payable returns(bool success)\
   \{\
   //withdrawFees - Owner Only \
   uint foundationFee;\
   uint fundingAmount;\
   uint finalAmount;\
   if(msg.sender != owner) throw;\
   if(!fundingSuccessful()) throw;\
   if(tokenHolder == true)\
   \{\
   fundingAmount = this.balance;    \
   foundationFee = (fundingAmount * 5)/100;\
   finalAmount = (fundingAmount - foundationFee);\
   owner.transfer(foundationFee);\
   LogFoundation(owner,foundationFee);\
   return true;\
   \}\
   fundingAmount = this.balance;    \
   foundationFee = (fundingAmount * 10)/100;\
   finalAmount = (fundingAmount - foundationFee);\
   owner.transfer(foundationFee);\
   LogFoundation(owner,foundationFee);\
   return true;\
   \}\
\
 \
   function withdrawFunds() public payable returns(bool success)\{\
   // WithdrawFunds - Offering Originator Only\
   uint fundingAmount;\
   if(msg.sender != offering) throw;\
   if(!fundingSuccessful()) throw;\
   fundingAmount = this.balance;\
   offering.transfer(fundingAmount);\
   LogFoundation(offering,fundingAmount);\
   return true;\
   \}\
   \
\
   \
   \
    \
   \
   \
 \
\
   \
\}}
