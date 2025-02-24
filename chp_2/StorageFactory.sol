// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {SimpleStorage} from "../chp_1/SimpleStorage.sol";

contract StorageFactory {

    SimpleStorage[] public listofSimpleStorages;

    function createSimpleStorage() public {
        listofSimpleStorages.push(new SimpleStorage());
    }

    function sf_get(uint256 _simpleStorageIndex) public view returns(uint256){
        return listofSimpleStorages[_simpleStorageIndex].retrieve();
    }

    function sf_store(uint256 _SimpleStorageIndex, uint256 _favoriateNumber) public {
        listofSimpleStorages[_SimpleStorageIndex].store(_favoriateNumber);
    }

}