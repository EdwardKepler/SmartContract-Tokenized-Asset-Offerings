import "./Owned.sol";

contract Listing is Owned{
bool public listed;

event LogListingSwitch(bool switchSetting);
modifier OnlyIfListed {
    require(!listed);
    _;
}
function Listing(){
    
    listed = true;

}
function ListingSwitch(bool OnOff)
    returns (bool success)
    {
        listed = OnOff;
        LogListingSwitch(OnOff);
        return true;
    }

}
