// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Import IERC20 interface từ OpenZeppelin
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract TransferTokenToMultipleAccounts {
    function transferTokenToMultipleAccounts(
        address tokenAddress,
        address[] calldata recipients,
        uint256[] calldata amounts
    ) external {
        require(recipients.length == amounts.length, "Recipients and amounts do not match.");
        IERC20 token = IERC20(tokenAddress);

        for (uint256 i = 0; i < recipients.length; i++) {
            require(token.transferFrom(msg.sender, recipients[i], amounts[i]), "Transfer failed.");
        }
    }
}
