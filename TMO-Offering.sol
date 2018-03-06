pragma solidity ^0.4.20;
import "./Listing.sol";
    contract Offering is Owned{
    // Smart Contract For Tokenized Asset Offerings -TAO Foundation [Edward Kepler]
    // Smart Contract For Metals[Precious] Offering [TMO]
    address public offering = 0x4b0897b0513fdc7c541b6d9d7e929c4e5364d2db;
    string  public token1;
    string  public prePrice;
    string  public price;
    bool  public bonus;
    string  public platform;
    string  public accepting;
    string  public minimum;
    string  public softCap;
    string  public hardCap;
    string  public country;
    string  public whitelistKYC;
    string  public videoLink;
    string  public infoLink;
    string  public restricted;
    string  public assetName;
    string  public assetType;
    string  public assetDescription;
    string  public assetIdentifier;
    string  public metalsType;
    string  public metalsMarket;
    string  public offeringName;
    string  public offeringDescription;
    string  public offeringOwner;
    uint    public duration;
    uint    public goal;
    uint    public fundsRaised;
    bool    public refundSent;
    bool    public tokenHolder;
    
    
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
           // [TBO] Tokenized Building Offering
           // Tokenized - [ITO,TDO,TNO,TTO,TRO,TLO,TPO,TMO,TGO,TPO]
           
          function setToken(string token) public {
          token1 = token;
          }
          function getToken() public constant returns (string) {
          return (token1);
          }
          function setAddress(address _address) public {
          offering = _address;
          }
          function getAddress() public constant returns (address) {
          return (offering);
          }
          
            // Asset - Overview
          
          function setAssetName(string _assetName) public {
          assetName = _assetName;
          }
          function getAssetName() public constant returns (string) {
          return (assetName);
          }
          function setAssetType(string _assetType) public {
          assetType = _assetType;
          }
          function getAssetType() public constant returns (string) {
          return (assetType);
          }
          function setAssetDescription(string _assetDescription) public {
          assetDescription = _assetDescription;
          }
          function getAssetDescription() public constant returns (string) {
          return (assetDescription);
          }
          function setAssetIdentifiers(string _assetIdentifier) public {
          assetIdentifier = _assetIdentifier;
          }
          function getAssetIdentitiers() public constant returns (string) {
          return (assetIdentifier);
          }
          function setMetalsType(string _metalsType) public {
          metalsType = _metalsType;
          }
          function getMetalsType() public constant returns (string) {
          return (metalsType);
          }
          function setMetalsMarket(string _metalsMarket public {
          metalsMarket = _metalsMarket;
          }
          function getMetalsMarket() public constant returns (string) {
          return (metalsMarket);
          }
          
          
            // Offering - Overview
          
          function setOfferingName(string _offeringName) public {
          offeringName = _offeringName;
          }
          function setOfferingDescription(string _offeringDescription) public {
          offeringDescription = _offeringDescription;
          }
          function setOfferingOwner(string _offeringOwner) public {
          offeringOwner = _offeringOwner;
          }
          function getOfferingName() public constant returns (string) {
            return (offeringName);
          }
          function getOfferingDescription()  public constant returns (string){
          return (offeringDescription);
          }
          function getOfferingOwner() public constant returns (string) {
          return (offeringOwner);
          }
          function setprePrice(string _prePrice) public {
          prePrice = _prePrice;
          }
          function getPrePrice() public constant returns (string) {
            return (prePrice);
          }
          function setPrice(string _price) public {
          price = _price;
          }
          function getPrice() public constant returns (string) {
            return (price);
          }
          function setBonus(bool _bonus) public {
          bonus = _bonus;
          }
          function getBonus() public constant returns (bool) {
            return (bonus);
          }
          function setPlatform(string _platform) public payable returns (string) {
            platform = _platform;
          }
          function getPlatform() public constant returns (string) {
            return (platform);
          }
          function setAccepting(string _accepting) public payable returns (string) {
            accepting = _accepting;
          }
          function getAccepting() public constant returns (string) {
            return (accepting);
          }
           function setMinimum(string _minimum) public payable returns (string) {
            minimum = _minimum;
          }
          function getMinimum() public constant returns (string) {
            return (minimum); 
          }
           function setSoftCap(string _softCap) public payable returns (string) {
            softCap = _softCap;
          }
        
          function getSoftCap() public constant returns (string) {
            return (softCap);  
          }
            function setHardCap(string _hardCap) public payable returns (string) {
            hardCap = _hardCap;
          }
          function getHardCap() public constant returns (string) {
            return (hardCap);  
          }
          function setCountry(string _country) public payable returns (string) {
            country = _country;
          }
          function getCountry() public constant returns (string) {
             return (country);  
          }
          function setWhitelistKYC(string _whitelistKYC) public payable returns (string) {
            whitelistKYC = _whitelistKYC;
          }
          function getWhitelistKYC() public constant returns (string) {
            return (whitelistKYC);  
          }
          function setRestricted(string _restricted) public payable returns (string) {
            restricted = _restricted;
          }
          function getRestricted() public constant returns (string) {
            return (restricted);  
          }
          function setInfoLink(string _infoLink) public payable returns (string) {
            infoLink = _infoLink;
          }
          function getInfoLink() public payable returns (string) {
            return (infoLink);  
          }
          function setVideoLink(string _videoLink) public payable returns (string) {
            videoLink = _videoLink;
          }
          function getVideoLink() public constant returns (string) {
            return (videoLink);  
          }
          function setTokenHolder(bool _tokenHolder) public payable returns (bool) {
            tokenHolder = _tokenHolder;
          }
          function getTokenHolder() public constant returns (bool) {
            return (tokenHolder);  
          }
      
         
      
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
    
    function Offering(uint fundingDuration,uint fundingGoal, string token) public payable{
    //Create Offering
    owner = Owned.owner;
    token1 = token;
    duration = block.number + fundingDuration;
    goal = fundingGoal;
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

   function withdrawFees() public payable returns(bool success)
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
   

