//#####################################################################################
//	Unit Spawn Script
//	@Autor (S)corpioN. 														@DEUTSCH
//	nul = [anzGruppen, position, radius]execVM "unitSpawn.sqf"
//#####################################################################################

_count = _this select 0;
_pos = _this select 1;
_radius = _this select 2;
_unitPool = _this select 3;
_size = 75;
_side = east;


_i = 0;
while{_i <= _count} do{
	_groupSize = 0;
	_groupSize = (round(random 5))+5; //sollte eine Zahl von 4 bis 10 ausgeben.
	
	
	_group = [];
	while{count _group < _groupSize}do {
		_unit = _unitPool call BIS_fnc_selectRandom;
		
		_group = _group + [_unit];
	};
	
	_grp = "";
	_grpFormat = format["_grp%1", _i];
    
    
	//hint format["%1",allGroups];
	_x = (_pos select 0) + cos (round (random 360)) * round(random(_radius));
    _y = (_pos select 1) + sin (round (random 360)) * round(random(_radius));
    _neuePos = [_x, _y, 0];
    
	_grpFormat = createGroup _side;
	_grpFormat = [_neuePos, _side, _group] call BIS_fnc_spawnGroup;
    [_grpFormat, _pos, _size] call BIS_fnc_taskPatrol; 
	
	
	
	_i = _i + 1;
	sleep 0.5;
};