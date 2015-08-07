//#####################################################################################
//	City Makierungs Hilfs-script
//	@Autor (S)corpioN. 														@DEUTSCH
//	nul = []execVM "city.sqf"
//#####################################################################################


//_towns = nearestLocations [getPosATL player, ["NameVillage","NameCity","NameCityCapital"], 25000];

_villages = nearestLocations [[0,0,0], ["NameVillage"], 50000];
_cities = nearestLocations [[0,0,0], ["NameCity"], 50000];
_capitalCities = nearestLocations [[0,0,0], ["NameCityCapital"], 50000];

_villageCount = count _villages;
_cityCount = count _cities;
_capCityCount = count _capitalCities;

hint format["%1", _cities select 5];

_x = 0;
while{_x < _villageCount}do{
    _stringX = format["circleX%1",_x];
    _mrkX = createMarker[_stringX, position (_villages select _x)];
    _stringX setMarkerShape "ELLIPSE";
    _stringX setMarkerSize [150, 150];
    _stringX setMarkerColor "ColorYellow";
    _x = _x + 1;
};

_y = 0;
while{_y < _cityCount}do{
    _stringY = format["circleY%1",_y];
    _mrkY = createMarker[_stringY, position (_cities select _y)];
    _stringY setMarkerShape "ELLIPSE";
    _stringY setMarkerSize [250, 250];
    _stringY setMarkerColor "ColorOrange";
    _y = _y + 1;
};

_z = 0;
while{_z < _capCityCount}do{
    _stringZ = format["circleZ%1",_z];
    _circle = createMarker[_stringZ, position (_capitalCities select _z)];
    _stringZ setMarkerShape "ELLIPSE";
    _stringZ setMarkerSize [400, 400];
    _stringZ setMarkerColor "ColorRed";
    _z = _z + 1;
};

//hint format["X: %1 \nY: %2 \nZ: %3", _x, _y, _z];