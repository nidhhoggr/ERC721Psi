import './ERC721PsiMockUpgradeable.sol';
import './ERC721PsiDiamondMockUpgradeable.sol';

contract ERC721PsiMockUpgradeableWithInit is ERC721PsiMockUpgradeable {
    constructor(string memory name_, string memory symbol_) initializer {
        __ERC721Psi_init_unchained(name_, symbol_);
    }
}

import './ERC721PsiDiamondMockUpgradeable.sol';

contract ERC721PsiDiamondMockUpgradeableWithInit is ERC721PsiDiamondMockUpgradeable {
    constructor(string memory name_, string memory symbol_) payable initializerERC721Psi {
        __ERC721PsiDiamond_init_unchained(name_, symbol_);
    }
}