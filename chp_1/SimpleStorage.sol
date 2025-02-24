// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleStorage {

    uint256 public favoriateNumber;

    function store(uint256 _favoriateNumber) public virtual {
        favoriateNumber = _favoriateNumber;
    }

    function retrieve() public view returns(uint256){
        return favoriateNumber;
    }

    struct Person {
        string name;
        uint256 number;
    }

    Person[] public listOfPeoples;

    mapping(string => uint256) personToNumber;

    function addPerson(string memory _name, uint256 _number) public {
        listOfPeoples.push(Person(_name, _number));
        personToNumber[_name] = _number;
    }

    function getFavoriateNumber(string memory _name) public view returns(uint256){
        return personToNumber[_name];
    }
}