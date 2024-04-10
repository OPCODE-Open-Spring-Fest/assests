

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
        bool exist;
    }

    mapping (address => AssetDetails) public assetMapping;
    
    modifier isPositive5(uint num1, uint num2, uint num3, uint num4, uint num5){
        require(num1>0 && num2>0 && num3>0 && num4>0 && num5>0, "Invalid Input");
        _;
    }
    
    modifier userPresent(){
        require(assetMapping[msg.sender].exist, "User not found");
        _;
    }

    function setDetails(
        uint houses,
        uint jewellery,
        uint cars,
        uint land,
        uint miscellaneous) external isPositive5(houses, jewellery, cars, land, miscellaneous) {
     
        AssetDetails memory assets = AssetDetails(houses, jewellery, cars, land, miscellaneous, true);
        assetMapping[msg.sender] = assets;    

    }

    function viewAssets()public view userPresent returns(uint[5] memory){
        AssetDetails memory assets = assetMapping[msg.sender];
        uint[5] memory assetArray = [assets.houses, assets.jewellery, assets.cars, assets.land,  assets.miscellaneous];
        return assetArray;
    }

    function checkNetWorth() external view userPresent returns(uint){
        uint[5] memory assetArray = viewAssets();
        uint netWorth = assetArray[0] + assetArray[1] + assetArray[2] + assetArray[3] + assetArray[4];
        return netWorth;
    }
}


