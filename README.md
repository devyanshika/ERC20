# Project Title

IceCreamToken

## Description

A simple ERC-20 token named "IceCream Token" with symbol "ICA". This project demonstrates the creation and deployment of an Ethereum-based ERC-20 token using Solidity and OpenZeppelin libraries. The `IceCreamToken` contract is an ERC-20 token that allows users to mint a predefined supply of tokens. It uses OpenZeppelin’s `ERC20` and `Ownable` contracts to provide standard token functionality and ownership features. The initial supply of 1000 tokens is minted to the contract deployer's address upon deployment.

## Getting Started

### Installing
use remix ide for the above 

### Executing program
1) use open zepplin to import the github file and token.
2) use remix ide to write the code
   // SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/access/Ownable.sol";

contract IceCreamToken is ERC20, Ownable {
    constructor() ERC20("IceCreamToken", "ICT") {
        _mint(msg.sender, 100 * 10**decimals());
    }


    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }


     
    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }

  
}
3) compile the code
4)deploy:-
  a) mint the fucntion
  b) burn the function 
  c) then check whether it can only be done by the owner or not.

## Help

Any advise for common problems or issues.
```
command to run if program contains helper info
```

## Authors
Devyanshika Pandey


## License

This project is licensed under the [MIT] License - see the LICENSE.md file for details
