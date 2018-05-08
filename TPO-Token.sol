pragma solidity ^0.4.20;

 contract TPOToken {
     string public name = "TPO Token";
     string public symbol = "TPO";
     string public standard = "TPO Tokenized Property Offering Version 1.0";
     uint256 public totalSupply;
     
     event Transfer(
         address indexed _from,
         address indexed _to,
         uint256 _value
         );
         
     event Approve(
         address indexed _owner,
         address indexed _spender,
         uint256 _value
         );
         
     mapping(address => uint256) public balanceOf;
     mapping(address => mapping(address => uint256)) public allowance;
     
     function TPOToken(uint256 _initialSupply) public {
         balanceOf[msg.sender] = _initialSupply;
         totalSupply = _initialSupply;
     }
     
     function transfer(address _to, uint256 _value) public returns (bool success) {
         require(balanceOf[msg.sender] >= _value);
         
         balanceOf[msg.sender] -= _value;
         balanceOf[_to] += _value;
         
         Transfer(msg.sender, _to, _value);
         return true;
     
     }
      function approve(address _spender, uint256 _value) public returns (bool success) {
         Approve(msg.sender,_spender,_value);
         return true;
     }
     function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
       require(_value <= balanceOf[_from]);
       require(_value <= allowance[_from][msg.sender]);
       Transfer(_from, _to, _value);
       return true;
       
       
     }
    
 }
