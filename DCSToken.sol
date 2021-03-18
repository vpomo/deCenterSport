pragma solidity ^0.5.8;

import "./Context.sol";
import "./ITRC20.sol";
import "./BaseTRC20.sol";
import "./Ownable.sol";

contract DCSToken is ITRC20, TRC20Detailed, Ownable {
    constructor(address _owner) public TRC20Detailed("deCenterSport", "DCS", 8) Ownable(_owner) {
        require(_owner != address(0), "invalid owner");
        _mint(_owner, 10000000 * 10 ** 8);
    }

    function burn(uint256 _value) external {
        _burn(_msgSender(), _value);
    }

    function transferAnyToken(address _tokenAddress, address _to, uint _amount) public onlyOwner {
        require(_to != address(0), "invalid receiver");
        ITRC20(_tokenAddress).transfer(_to, _amount);
    }
}
