pragma solidity ^0.5.16;

import "./ApeErc20NoInterest.sol";

/**
 * @title ApeFinance's ApeErc20NoInterestDelegate Contract
 * @notice ApeTokens which wrap an EIP-20 underlying and are delegated to
 */
contract ApeErc20NoInterestDelegate is ApeErc20NoInterest, CDelegateInterface {
    /**
     * @notice Construct an empty delegate
     */
    constructor() public {}

    /**
     * @notice Called by the delegator on a delegate to initialize it for duty
     * @param data The encoded bytes data for any initialization
     */
    function _becomeImplementation(bytes memory data) public {
        // Shh -- currently unused
        data;

        // Shh -- we don't ever want this hook to be marked pure
        if (false) {
            implementation = address(0);
        }

        require(msg.sender == admin, "admin only");
        require(version == Version.VANILLA, "mismatch version");
    }

    /**
     * @notice Called by the delegator on a delegate to forfeit its responsibility
     */
    function _resignImplementation() public {
        // Shh -- we don't ever want this hook to be marked pure
        if (false) {
            implementation = address(0);
        }

        require(msg.sender == admin, "admin only");
    }
}
