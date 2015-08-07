//#####################################################################################
//	House Spawn Script
//	@Autor (S)corpioN. 														@DEUTSCH
//	
//#####################################################################################

if(isServer)then{

hint "spawn house";
_houses = ["Land_i_House_Big_01_V1_F", "Land_i_Shop_01_V3_F", "Land_i_Shop_02_V1_F",
           "Land_i_House_Small_01_V1_F", "Land_i_House_Small_02_V1_F"];
_dirs = [90, 180, 270, 360];

_house = _houses call BIS_fnc_selectRandom;
_dir = _dirs call BIS_fnc_selectRandom;
_house1 = _house createVehicle getMarkerPos "mrk1";
_house1 setDir _dir;

_i = 0;
while{format["%1", _house1 buildingPos _i] != "[0,0,0]"}do{
    _i = _i+1;
};

hint format["%1", _house1];

nul = [_house1]execVM "placeDummy.sqf";

sleep 300;

deleteVehicle _house1;
    
};