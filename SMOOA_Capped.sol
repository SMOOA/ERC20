pragma solidity ^0.4.24;

/**
 * @title Capped token
 * @dev Mintable token with a token cap.
 */
contract SMOOACapped is SMOOAMintable {

  uint256 private _cap;

  constructor(uint256 cap)
    public
  {
    require(cap > 0);
    _cap = 100000000;
  }

  /**
   * @return the cap for the token minting.
   */
  function cap() public view returns(uint256) {
    return _cap;
  }

  /**
   * @dev Function to mint tokens
   * @param to The address that will receive the minted tokens.
   * @param value The amount of tokens to mint.
   * @return A boolean that indicates if the operation was successful.
   */
  function mint(
    address to,
    uint256 value
  )
    public
    returns (bool)
  {
    require(totalSupply().add(value) <= _cap);

    return super.mint(to, value);
  }

}
