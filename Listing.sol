
pragma solidity ^0.4.20;
import "./Owned.sol";

contract Listing is Owned{
bool public Listed;

event LogListingSwitch(bool switchSetting);

modifier OnlyIfListed {
    require(!Listed);
    _;
}
function Listing(){
    Listed = true;
}
function ListingSwitch(bool OnOff)
    returns (bool success)
    {
        Listed = OnOff;
        LogListingSwitch(OnOff);
        return true;
    }

}
