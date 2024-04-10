
//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract net_worth_mate
{
   
        
  struct AssetDetails {
        uint houses;
        uint jewellery;
        uint cars;
        uint land;
        uint miscellaneous;
    }

    mapping (address => AssetDetails) public assetMapping;
    
    //modifier isPositive5(uint num1, uint num2, uint num3, uint num4, uint num5){
    //    require(num1>0 && num2>0 && num3>0 && num4>0 && num5>0, "Invalid Input");
    //    _;
    //}

    function setDetails(
        uint houses,
        uint jewellery,
        uint cars,
        uint land,
        uint miscellaneous) external {
     
        AssetDetails memory assets = AssetDetails(houses, jewellery, cars, land, miscellaneous);
        assetMapping[msg.sender] = assets;    

    }

    function viewAssets()public view returns(uint[5] memory){
        AssetDetails memory assets = assetMapping[msg.sender];
        uint[5] memory assetArray = [assets.houses, assets.jewellery, assets.cars, assets.land,  assets.miscellaneous];
        return assetArray;
    }
}

