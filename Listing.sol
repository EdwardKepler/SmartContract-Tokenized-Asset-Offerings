{\rtf1\ansi\ansicpg1252\cocoartf1504\cocoasubrtf830
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 pragma solidity ^0.4.20;\
import "./Owned.sol";\
\
contract Listing is Owned\{\
bool public listed;\
\
event LogListingSwitch(bool switchSetting);\
modifier OnlyIfListed \{\
    require(!listed);\
    _;\
\}\
function Listing()\{\
    \
    listed = true;\
\
\}\
function ListingSwitch(bool OnOff)\
    returns (bool success)\
    \{\
        listed = OnOff;\
        LogListingSwitch(OnOff);\
        return true;\
    \}\
\
\}}