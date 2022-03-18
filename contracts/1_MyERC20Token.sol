// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;



import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SamuelToken is ERC20, Ownable {
    uint public salePrice = 1000;

    constructor() ERC20("Samuel Token", "SAT") {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
        event Bought(uint256 amount);

    

    function buyToken(address receiver) payable public {
        uint256 amountTobuy = msg.value * salePrice;
        require(amountTobuy > 0, "You need to send some ether");
        require(amountTobuy <= totalSupply(), "Not enough tokens in the reserve");
        _mint(receiver, amountTobuy); 
        emit Bought(amountTobuy);
    
    }
}