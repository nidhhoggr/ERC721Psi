// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import './ERC721PsiMockUpgradeable.sol';
import './StartTokenIdHelperUpgradeable.sol';
import {StartTokenIdHelperStorage} from './StartTokenIdHelperStorage.sol';
import '../ERC721PsiInitializable.sol';

contract ERC721PsiStartTokenIdMockUpgradeable is
    ERC721PsiInitializable,
    StartTokenIdHelperUpgradeable,
    ERC721PsiMockUpgradeable
{
    using StartTokenIdHelperStorage for StartTokenIdHelperStorage.Layout;

    function initializeWithStartTokenId(
        string memory name_, 
        string memory symbol_,
        uint256 startTokenId_
    ) initializerERC721Psi external {
        __ERC721PsiStartTokenIdMock_init(name_, symbol_, startTokenId_);
    }

    function __ERC721PsiStartTokenIdMock_init(
        string memory name_,
        string memory symbol_,
        uint256 startTokenId_
    ) internal onlyInitializingERC721Psi {
        __StartTokenIdHelper_init_unchained(startTokenId_);
        __ERC721Psi_init_unchained(name_, symbol_);
        __ERC721PsiMock_init_unchained(name_, symbol_);
        __ERC721PsiStartTokenIdMock_init_unchained(name_, symbol_, startTokenId_);
    }

    function __ERC721PsiStartTokenIdMock_init_unchained(
        string memory,
        string memory,
        uint256
    ) internal onlyInitializingERC721Psi {}

    function _startTokenId() internal view override returns (uint256) {
        return StartTokenIdHelperStorage.layout().startTokenId;
    }
}