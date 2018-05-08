{\rtf1\ansi\ansicpg1252\cocoartf1504\cocoasubrtf830
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 pragma solidity ^0.4.20;\
\
 contract TMOToken \{\
     string public name = "TMO Token";\
     string public symbol = "TMO";\
     string public standard = "TMO Tokenized Museum Offering Version 1.0";\
     uint256 public totalSupply;\
     \
     event Transfer(\
         address indexed _from,\
         address indexed _to,\
         uint256 _value\
         );\
         \
     event Approve(\
         address indexed _owner,\
         address indexed _spender,\
         uint256 _value\
         );\
         \
     mapping(address => uint256) public balanceOf;\
     mapping(address => mapping(address => uint256)) public allowance;\
     \
     function TMOToken(uint256 _initialSupply) public \{\
         balanceOf[msg.sender] = _initialSupply;\
         totalSupply = _initialSupply;\
     \}\
     \
     function transfer(address _to, uint256 _value) public returns (bool success) \{\
         require(balanceOf[msg.sender] >= _value);\
         \
         balanceOf[msg.sender] -= _value;\
         balanceOf[_to] += _value;\
         \
         Transfer(msg.sender, _to, _value);\
         return true;\
     \
     \}\
      function approve(address _spender, uint256 _value) public returns (bool success) \{\
         Approve(msg.sender,_spender,_value);\
         return true;\
     \}\
     function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) \{\
       require(_value <= balanceOf[_from]);\
       require(_value <= allowance[_from][msg.sender]);\
       Transfer(_from, _to, _value);\
       return true;\
       \
       \
     \}\
    \
 \}}