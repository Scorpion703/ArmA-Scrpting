//#####################################################################################
//	Patroll Script
//	@Autor (S)corpioN. 														@DEUTSCH
//	
//#####################################################################################

_grp = _this return 0;
_pos = position _grp;
_size = 250;


_mrkVar = ["cricleSmall", _pos];
"circleSmall" setMarkerShape "ELLIPSE";
"circleSmall" setMarkerSize _size;
"cicleSmall" setMarkerColor "ColorBLUFOR";

_mrkVar = createMarker["circleBig", _pos];
"circleBig" setMarkerShape "ELLIPSE";
"circleBig" setMarkerSize _size;
"circleBig" setMarkerColor "ColorBLUFOR";


while(_i < _count)then{
    _mrkVar = createMarker[_mrk, _pos];
    _mrk setMarkerType "hd_dot";
};