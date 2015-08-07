//#####################################################################################
//	Spawn Targets in Houses
//	@Autor (S)corpioN. 														@DEUTSCH
//	0 = [house]execVM "placeDummy.sqf"; 
//#####################################################################################

if(isServer)then{

_building = _this select 0;

_positions = [];
_dummys = []; //array hold that dummys


_i = 0;
while{format["%1", _building buildingPos _i] != "[0,0,0]"}do{
    _posi = _building buildingPos _i;
    _positions = _positions + [_posi];
    _i = _i+1;
};
//#####################################################################################

//fill house with targets (max = number of house positions)
_max = floor random _i;

//hint format["%1", _i];


//while loop which plases the dummys in that selected house
_i = 0;
while{_i < _max}do{
    
    //select random position out of position array and delete the position so that no 2 units can placed at the same positon
	_pos = _positions call BIS_fnc_selectRandom;
	_positions = _positions - [_pos];
    
    //generate unique dummy variable names:
    _dummy = format["dummy%1", _i];
    
    //that the dummy cant move
    _dummy = "O_Soldier_VR_F" createVehicle _pos;
    _dummys = _dummys + [_dummy];
	_dummy setPos _pos;
    _i = _i + 1;
};


//checking if dummy is dead... if dummy is dead remove the dummy 
while{count _dummys != 0}do{
    _i = 0;
    while{_i < count _dummys}do{
        _dummy = _dummys select _i;
        if(!alive _dummy)then{
            _dummys = _dummys - [_dummy];
            deleteVehicle _dummy;
        };
    };
    sleep 1;
};
    
};