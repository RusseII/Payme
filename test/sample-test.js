const { expect } = require('chai');
const { ethers } = require('hardhat');

describe('Payments', function () {
  it('Should allow sending money', async function () {
    const Payments = await ethers.getContractFactory('Payments');
    const greeter = await Payments.deploy();
    await greeter.deployed();
    expect(await greeter.getBalance()).to.equal(0);
  });
});
