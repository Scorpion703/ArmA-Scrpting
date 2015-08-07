//#####################################################################################
//	Vehicle Respawn Script
//	@Autor (S)corpioN. 														@DEUTSCH
//	nul = [this,respawndelay] execVM "respawn.sqf";
//#####################################################################################



_vehicle = _this select 0;
_respawnDelay = _this select 1;
_direction = getDir _vehicle;
_position = getPos _vehicle;
_type = typeOf _vehicle;

_respawned = true;
while{_respawned} do{
	if(!alive _vehicle) then{
		hint "start respawn timer";
		sleep _respawnDelay;
		
		deleteVehicle _vehicle;
		_vehicle = createVehicle[_type, _position, [], 0, "CAN_COLLIDE"];
		_vehicle setDir _direction;
		//_vehicle name _name;
		//_respawned = false;
	};
	//hint format["Position [%1, %2, %3]\n Dir = %4", _position select 0, _position select 1, _position select 2, _direction];
	sleep 1;
	//hint format["%1", _this select 0];
};