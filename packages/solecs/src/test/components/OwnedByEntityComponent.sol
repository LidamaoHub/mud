// SPDX-License-Identifier: Unlicense
pragma solidity >=0.8.0;
import { Component } from "../../Component.sol";

contract OwnedByEntityComponent is Component {
  uint256 public constant ID = uint256(keccak256("lib.ownedByEntity"));

  constructor(address world) Component(world) {}

  function getID() public pure override returns (uint256) {
    return ID;
  }

  function set(uint256 entity, uint256 ownedByEntity) public {
    set(entity, abi.encode(ownedByEntity));
  }

  function getValue(uint256 entity) public view returns (uint256) {
    return abi.decode(getRawValue(entity), (uint256));
  }

  function getEntitiesWithValue(uint256 ownedByEntity) public view returns (uint256[] memory) {
    return getEntitiesWithValue(abi.encode(ownedByEntity));
  }
}