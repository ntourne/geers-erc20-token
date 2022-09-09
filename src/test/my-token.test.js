// Right click on the script name and hit "Run" to execute
const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("MyToken", function () {
  const name = "Nicolas";
  const symbol = "NICOIN";

  beforeEach(async function () {
    const MyToken = await ethers.getContractFactory("MyToken");
    const myToken = await MyToken.deploy(name, symbol);
    this.myTokenContract = await myToken.deployed();

    this.signer = new ethers.providers.Web3Provider(web3Provider).getSigner();

    this.accounts = await web3.eth.getAccounts();
  });

  describe("initialization", function () {
    it("has a name", async function () {
      expect(await this.myTokenContract.name()).to.equal(name);
    });

    it("has a symbol", async function () {
      expect(await this.myTokenContract.symbol()).to.equal(symbol);
    });

    it("has 0 decimals", async function () {
      expect(await this.myTokenContract.decimals()).to.be.equal(0);
    });

    it("owner has correct balance", async function () {
      const [owner] = this.accounts;
      const totalSupply = await this.myTokenContract.totalSupply();
      expect(await this.myTokenContract.balanceOf(owner)).to.be.equal(
        totalSupply
      );
    });
  });

  describe("transfer", function () {
    it("when from account has enough balance", async function () {
      const [owner, receiver] = this.accounts;
      await this.myTokenContract.transfer(receiver, 5000);

      const totalSupply = await this.myTokenContract.totalSupply();

      expect(
        (await this.myTokenContract.balanceOf(owner)).toNumber()
      ).to.be.equal(totalSupply - 5000);
      expect(
        (await this.myTokenContract.balanceOf(receiver)).toNumber()
      ).to.be.equal(5000);
    });

    it("when from account has not enough balance", async function () {
      // TODO Check how to connect with 2nd account
      const [owner, receiver] = this.accounts;
      const ownerBalance = await this.myTokenContract.balanceOf(owner);
      expect(this.myTokenContract.transfer(receiver, ownerBalance + 5000)).to.be
        .reverted;
    });
  });
});
