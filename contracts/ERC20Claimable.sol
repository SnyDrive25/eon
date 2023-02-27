pragma solidity >=0.6.0 <0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ERC20Claimable is ERC20 {

	address usdcAddress = 0x65aFADD39029741B3b8f0756952C74678c9cEC93;

	constructor(string memory name, string memory symbol, uint256 initialSupply) public ERC20(name, symbol)
	{
		_mint(msg.sender, initialSupply);
	}

	function symbol() public view override returns(string memory) {
		return ("testEON-01");
	}

	function claimTokens(uint256 amount) public returns (uint256)
	{
		amount = amount * 10 ** 6;
		require(amount != 0, "Le paiement n'est pas accepté"); // Le paiement n'est pas accepté directement
		ERC20 usdc = ERC20(usdcAddress); // Obtenir une instance du contrat USDC
        bool success = usdc.transferFrom(msg.sender, address(this), amount); // Transférer 100 USDC du compte de l'utilisateur au contrat
        require(success, "Transfert USDC échoué"); // Vérifier que le transfert a réussi
		_mint(msg.sender, amount * 10 ** 12);
		return amount * 10 ** 12;
	}

}