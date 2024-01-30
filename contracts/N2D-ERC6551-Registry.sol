// SPDX-License-Identifier: MIT

/*
Follow/Subscribe Youtube, Github, IM, Tiktok
for more amazing content!!
@Net2Dev
███╗░░██╗███████╗████████╗██████╗░██████╗░███████╗██╗░░░██╗
████╗░██║██╔════╝╚══██╔══╝╚════██╗██╔══██╗██╔════╝██║░░░██║
██╔██╗██║█████╗░░░░░██║░░░░░███╔═╝██║░░██║█████╗░░╚██╗░██╔╝
██║╚████║██╔══╝░░░░░██║░░░██╔══╝░░██║░░██║██╔══╝░░░╚████╔╝░
██║░╚███║███████╗░░░██║░░░███████╗██████╔╝███████╗░░╚██╔╝░░
╚═╝░░╚══╝╚══════╝░░░╚═╝░░░╚══════╝╚═════╝░╚══════╝░░░╚═╝░░░
THIS CONTRACT IS AVAILABLE FOR EDUCATIONAL 
PURPOSES ONLY. YOU ARE SOLELY REPONSIBLE 
FOR ITS USE. I AM NOT RESPONSIBLE FOR ANY
OTHER USE. THIS IS TRAINING/EDUCATIONAL
MATERIAL. ONLY USE IT IF YOU AGREE TO THE
TERMS SPECIFIED ABOVE.
*/

pragma solidity ^0.8.19;

import "@openzeppelin/contracts/utils/Create2.sol";
import "https://github.com/net2devcrypto/ERC-6551-NFT-Wallets-Web3-Front-End-NextJS/blob/main/imports/IERC6551.sol"; 
import "https://github.com/net2devcrypto/ERC-6551-NFT-Wallets-Web3-Front-End-NextJS/blob/main/imports/ERC6551Bytecode.sol";

contract ERC6551Registry is IERC6551Registry {
    
    function createAccount(
        address accountContract,
        uint256 chainId,
        address nftContract,
        uint256 nftId,
        uint256 salt
    ) external returns (address) {
        bytes memory code = _creationCode(accountContract, chainId, nftContract, nftId, salt);
        address _account = Create2.computeAddress(bytes32(salt), keccak256(code));
        if (_account.code.length != 0) return _account;
        _account = Create2.deploy(0, bytes32(salt), code);
        emit AccountCreated(
            _account,
            accountContract,
            chainId,
            nftContract,
            nftId,
            salt
        );
        return _account;
    }

    function account(
        address accountContract,
        uint256 chainId,
        address nftContract,
        uint256 nftId,
        uint256 salt
    ) external view returns (address) {
        bytes32 bytecodeHash = keccak256(
            _creationCode(accountContract, chainId, nftContract, nftId, salt)
        );

        return Create2.computeAddress(bytes32(salt), bytecodeHash);
    }

    function _creationCode(
        address accountContract_,
        uint256 chainId_,
        address nftContract_,
        uint256 nftId_,
        uint256 salt_
    ) internal pure returns (bytes memory) {
        return
            abi.encodePacked(
                hex"3d60ad80600a3d3981f3363d3d373d3d3d363d73",
                accountContract_,
                hex"5af43d82803e903d91602b57fd5bf3",
                abi.encode(salt_, chainId_, nftContract_, nftId_)
            );
    }
}
