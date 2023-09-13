// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract USDToEth {
  AggregatorV3Interface internal priceFeed;

  constructor(address _priceFeedAddress) {
    priceFeed = AggregatorV3Interface(_priceFeedAddress);
  }

  function convertUSDToEth(uint _usdAmount) public view returns (uint) {
    (, int price,,,) = priceFeed.latestRoundData();
    uint adjust_price = uint(price) * 1e10;
    uint ethAmount = _usdAmount * adjust_price;
    return ethAmount;
  }
}
