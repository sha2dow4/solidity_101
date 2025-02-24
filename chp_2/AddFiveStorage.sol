// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {SimpleStorage} from "../chp_1/SimpleStorage.sol";

contract AddFiveStorage is SimpleStorage{

    function store(uint256 _number) public override {
        favoriateNumber = _number + 5;
    }
}