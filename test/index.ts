import { expect } from "chai";
import { ethers } from "hardhat";

describe('Payments', function () {
  it('Should allow sending money', async function () {
    const [owner] = await ethers.getSigners()
    const Payments = await ethers.getContractFactory('Payments');
    const greeter = await Payments.deploy();
    await greeter.deployed();
    expect(await greeter.getUserBalance()).to.equal(0);
    expect(await greeter.getBalance()).to.equal(0);
    await owner.sendTransaction({ to: greeter.address, value: ethers.utils.parseEther('1') });
    expect(await greeter.getUserBalance()).to.equal(ethers.utils.parseEther('1'));
    expect(await greeter.getBalance()).to.equal(ethers.utils.parseEther('1'));
    await greeter.withdraw()
    expect(await greeter.getUserBalance()).to.equal(0);
    expect(await greeter.getBalance()).to.equal(0);
  });
});

