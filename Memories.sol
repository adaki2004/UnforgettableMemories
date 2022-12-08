// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import '@openzeppelin/contracts/token/ERC721/ERC721.sol';
import './Base64.sol';

contract UnforgettableMemories is ERC721 {

    // Image to base64
    // Online converter: 
    // https://onlinejpgtools.com/convert-jpg-to-base64
    string constant image = "data:image/jpg;base64,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";
    //address immutable _libStorageAddress;
    using Strings for uint256;
    uint256 _nextId = 1;

    constructor() ERC721 ('UnforgettableMemories', 'UM') {
        _mint();
    }

    function _mint() internal {
        _mint(msg.sender, _nextId);
        unchecked{
            ++ _nextId;
        }
    }

    function tokenURI(uint256 tokenId) override public pure returns (string memory) {

        string memory dataURI = string.concat(
            '{',
                '"name": "Unforgettable Memory #', tokenId.toString(), '",',
                '"description": "Images on-chain",',
                '"image": "', image, '"',
            '}'
        );
        return string(
            abi.encodePacked(
                "data:application/json;base64,",
                Base64.encode(dataURI)
            )
        );
    }
}