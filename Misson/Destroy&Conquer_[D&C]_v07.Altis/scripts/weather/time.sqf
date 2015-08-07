//#####################################################################################
//	Time Script
//	@Autor (S)corpioN. 														@DEUTSCH
//	
//#####################################################################################


_randMin = [0, 0.25, 0.5, 0.75] call BIS_fnc_selectRandom;

_randHour = floor (random 24);

_toFullHour = floor(daytime);
_toFullHour = 1-(daytime - _toFullHour);


_time = _toFullHour + (_randMin + _randHour);

//hint format ["%1", _time];

skipTime _time;

