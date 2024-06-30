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

