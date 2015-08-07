//#####################################################################################
//	WeatherScript
//	@Autor (S)corpioN. 														@DEUTSCH
//	
//#####################################################################################

1 setOvercast (random 1);
forceWeatherChange;

nul = execVM "scripts\weather\time.sqf";

while{true}do{
    _neueOvercast = random 1;
    _zeitVar = _neueOvercast - overcast;
    if(_zeitVar < 0)then{
        _zeitVar = _zeitVar^2;
        _zeitVar = sqrt _zeitVar;
    };
    _zeitVar = round(_zeitVar * 7200);
    
    _zeitVar setOvercast _neueOvercast;
    
    sleep _zeitVar;
};

