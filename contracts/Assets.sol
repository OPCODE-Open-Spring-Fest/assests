//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract asset
{
   
        
  struct AssetDetails {
        uint houses;
        uint jewellery;
        uint cars;
        uint land;
        uint miscellaneous;
    }

    mapping (address => AssetDetails) public assetMapping;
    function setDetails() public {

    }
}