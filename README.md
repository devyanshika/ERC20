# Project Title

IceCreamToken

## Description

The `IceCreamToken` is an ERC20-compliant smart contract deployed on the Ethereum blockchain. It allows users to mint, burn, and transfer tokens. The contract includes basic functionalities for token management and includes error handling for security and operational robustness.


## Getting Started

### Installing
use remix ide for the above 

### Executing program.
1) use remix ide to write the code
  // SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IceCreamToken {
    string public name = "IceCream";
    string public symbol = "ICRM";
    uint8 public decimals = 18;
    uint256 public totalSupply;

    address public owner;
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    event Burn(address indexed burner, uint256 value);
    event Mint(address indexed to, uint256 value);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only contract owner can call this function");
        _;
    }

    constructor(uint256 _initialSupply) {
        owner = msg.sender;
        mint(owner, _initialSupply); // Mint initial supply to the contract owner
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(_to != address(0), "Invalid recipient address");
        require(_value <= balanceOf[msg.sender], "Insufficient balance");

        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_to != address(0), "Invalid recipient address");
        require(_value <= balanceOf[_from], "Insufficient balance");
        require(_value <= allowance[_from][msg.sender], "Allowance exceeded");

        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        allowance[_from][msg.sender] -= _value;

        emit Transfer(_from, _to, _value);
        return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function mint(address _to, uint256 _value) public onlyOwner {
        require(_to != address(0), "Invalid address to mint to");
        totalSupply += _value;
        balanceOf[_to] += _value;

        emit Mint(_to, _value);
        emit Transfer(address(0), _to, _value); // Corrected here
    }

    function burn(uint256 _value) public {
        require(_value <= balanceOf[msg.sender], "Insufficient balance to burn");

        balanceOf[msg.sender] -= _value;
        totalSupply -= _value;

        emit Burn(msg.sender, _value);
        emit Transfer(msg.sender, address(0), _value);
    }

    // Explicitly reject Ether transfers
    receive() external payable {
        revert("Ether not accepted in this contract");
    }

    fallback() external payable {
        revert("Ether not accepted in this contract");
    }
}

2) compile the code

  ## Features

- **ERC20 Compliant**: Implements standard ERC20 token functionality.
- **Minting**: Only the contract owner can mint new tokens.
- **Burning**: Any user can burn their own tokens.
- **Transfer**: Users can transfer tokens to other addresses.
- **Error Handling**: Utilizes `require`, `assert`, and `revert` for robust error handling.


## Help

Any advise for common problems or issues.
```
command to run if program contains helper info
```

## Authors
Devyanshika Pandey


## License

This project is licensed under the [MIT] License - see the LICENSE.md file for details
