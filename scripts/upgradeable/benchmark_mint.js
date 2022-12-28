// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// When running the script with `npx hardhat run <script>` you'll find the Hardhat
// Runtime Environment's members available in the global scope.
const hre = require("hardhat");

async function main() {
  const accounts = await hre.ethers.getSigners();
  const deployer = accounts[0];
  const user1 = accounts[1];

  for(let i = 1; i < 30; i++){
    let ERC721Psi = await hre.ethers.getContractFactory("ERC721PsiMockUpgradeableWithInit");
    ERC721Psi = await ERC721Psi.deploy("ERC721Psi", "ERC721Psi");
    ERC721Psi = await ERC721Psi.deployed();

    let ERC721PsiDiamond = await hre.ethers.getContractFactory("ERC721PsiDiamondMockUpgradeableWithInit");
    ERC721PsiDiamond = await ERC721PsiDiamond.deploy("ERC721Psi", "ERC721Psi");
    ERC721PsiDiamond = await ERC721PsiDiamond.deployed();

    // Mint at least one token before to initialize most of the parameters, 
    // so the result fits the real world scenerio better
    await ERC721Psi['mint(address,uint256)'](user1.address, 1);
    await ERC721PsiDiamond['mint(address,uint256)'](user1.address, 1);

    console.log(i);
    let erc721Psi_mint = await ERC721Psi['mint(address,uint256)'](deployer.address, i);
    console.log("ERC721Psi Mint", (await erc721Psi_mint.wait()).gasUsed.toString());
    let erc721a_mint = await ERC721PsiDiamond['mint(address,uint256)'](deployer.address, i);
    console.log("ERC721PsiDiamond Mint", (await erc721a_mint.wait()).gasUsed.toString());
  }
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
