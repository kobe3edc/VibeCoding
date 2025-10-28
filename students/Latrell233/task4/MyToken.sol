// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {ERC20Burnable} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title MyToken
 * @dev 基于 OpenZeppelin 的可铸造、可销毁 ERC20，Owner 管理铸造权限。
 */
contract MyToken is ERC20, ERC20Burnable, Ownable {
    constructor(
        string memory name_,
        string memory symbol_,
        address initialOwner,
        uint256 initialSupply
    ) ERC20(name_, symbol_) Ownable(initialOwner) {
        if (initialOwner == address(0)) revert("OwnerZeroAddress");
        if (initialSupply > 0) {
            _mint(initialOwner, initialSupply);
        }
    }

    /**
     * @dev 仅 Owner 可铸造。
     */
    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }
}


