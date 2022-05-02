// SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";

contract DemoNFT is Ownable, ERC721("Demo", "DNFT") {
    uint tokenId;
    mapping(address=>tokenMetaData[]) public ownershipRecord;
    struct tokenMetaData{
    uint tokenId;
    uint timeStamp;
    }

    function mintToken(address recipient) onlyOwner public {
        require(owner()!=recipient, "Recipient cannot be the owner of the contract");
        _safeMint(msg.sender, tokenId);
        ownershipRecord[recipient].push(tokenMetaData(tokenId, block.timestamp));
        tokenId = tokenId + 1;
    }
}