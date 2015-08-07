//#####################################################################################
//	Der Schrankenöffner
//	@Autor (S)corpioN.														@DEUTSCH
//	nul = [this, distance] execVM "autoBargate.sqf";
//#####################################################################################

hint "Schrankenscript aktiviert!";


_bargate = _this select 0;
_distance = _this select 1;

_bargate animate["Door_1_rot", 0];

while{true} do{
	if((player distance _bargate) <= _distance)then{
		_bargate animate["Door_1_rot", 1];
		
	}else{
		_bargate animate["Door_1_rot", 0];
	};
	//hint format["%1",player distance _bargate];
	sleep 1;
};