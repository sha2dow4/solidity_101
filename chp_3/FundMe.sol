// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";
import {PriceConverter} from "./PriceConverter.sol";

contract FundMe {
    using PriceConverter for uint256;
    address[] public funders;
    mapping(address funders => uint256) public addressToAmountFunded;

    uint256 constant minimumUSD = 5e18;
    address public immutable owner;

    error notOwner();

    constructor() {
        owner = msg.sender;
    }

    function fund() public payable{
        require((msg.value).getConversionRate() > minimumUSD, "Must pay the minimum amount!");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;

    }

    function getVersion() public view returns(uint256){
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }

    function withdraw() public onlyOwner{
        for (uint256 addressIndex = 0; addressIndex < funders.length; addressIndex ++) {
            address funder = funders[addressIndex];
            addressToAmountFunded[funder] = 0;
        }

        payable(msg.sender).transfer(address(this).balance);
    } 

    modifier onlyOwner() {
        if (msg.sender != owner) {revert notOwner();}
        _;
    }

    receive() external payable {
        fund();
    }

    fallback() external payable {
        fund();
    }


}