// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./erc721.sol";

/**
 * @dev ERC-520 non-fungible token standard.
 * See https://github.com/marryinweb3/erc520
 */
interface ERC520 is ERC721 {
    enum Sex {
        Man,
        Woman,
        X
    }
    enum HistoryType {
        Marry,
        Divorce
    }
    struct AddressInfo {
        address partner;
        Sex sex;
        uint256 time;
        uint256 tokenId;
    }

    struct AddressInput {
        Sex sex;
    }

    /**
     * check if the two address is married
     */
    function check(address _a, address _b) external view returns (bool);

    /**
     * get address info and partner info
     */
    function getPairInfo(address _a)
        external
        view
        returns (AddressInfo memory, AddressInfo memory);

    function tokenURI(uint256 _tokenId) external view returns (string memory);
}
