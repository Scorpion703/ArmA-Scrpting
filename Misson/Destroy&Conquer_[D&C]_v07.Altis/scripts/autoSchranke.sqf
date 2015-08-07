//#####################################################################################
//	Der Schrankenöffner
//	@Autor (S)corpioN.														@DEUTSCH
//	
//#####################################################################################

//hint "Schrankenscript aktiviert!";

if(isServer)then{

_bargate = _this select 0;

//_bargate animate["Door_1_rot", 0];

while{true} do{
    
    _playerCount = {isPlayer _x && (_x distance _bargate) <= 10 && side _x == west} count allUnits;
    
	if(_playerCount >= 1)then{
		_bargate animate["Door_1_rot", 1];
		
	}else{
		_bargate animate["Door_1_rot", 0];
	};
	//hint format["%1",player distance _bargate];
	sleep 1;
};
    
};