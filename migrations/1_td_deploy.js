var ERC20Claimable = artifacts.require("ERC20Claimable.sol");

module.exports = (deployer, network, accounts) => {
    deployer.then(async () => {
        await deployTDToken(deployer, network, accounts); 
        // await deployEvaluator(deployer, network, accounts); 
        // await setPermissionsAndRandomValues(deployer, network, accounts); 
        // await setStaticContracts(deployer, network, accounts); 
        await deployRecap(deployer, network, accounts);
    });
};

async function deployTDToken(deployer, network, accounts) {
	ClaimableToken = await ERC20Claimable.new("testEON","testEON-01",web3.utils.toBN("200000000000000000000"))
}

async function setStaticContracts(deployer, network, accounts) {
	ClaimableToken = await ERC20Claimable.at("0xE70AE39bDaB3c3Df5225E03032D31301E2E71B6b")
}

async function deployRecap(deployer, network, accounts) {
	console.log("ClaimableToken " + ClaimableToken.address)
}