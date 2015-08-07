//#####################################################################################
//	Missiontype "Clearing City"
//	@Autor (S)corpioN. 														@DEUTSCH
//	nul = [position, radius, minUnits]execVM "clearing.sqf"
//#####################################################################################


_pos = _this select 0;
_radius = _this select 1;
_minUnits = _this select 2;


//Create a Circle
_circle = createMarker["circle", _pos];
"circle" setMarkerShape "ELLIPSE";
"circle" setMarkerSize [_radius, _radius];
"circle" setMarkerColor "ColorOPFOR";


//Create the Task
_task = player createSimpleTask ["Saeuberung der Stadt"];
_task setSimpleTaskDescription ["In der Stadt sind feindliche Truppen. Deine Aufgabe ist es, diese zu eleminieren.", "Saeubere die Stadt", "Saeubere die Stadt"];
_task setSimpleTaskDestination (_pos);
_task setTaskState "Assigned";
["TaskAssigned",["","Saeuberung der Stadt"]] call BIS_fnc_showNotification;
player setCurrentTask _task;


while{taskState _task != "Succeeded"}do{
    sleep 10;
    _cntEast = {alive _x && side _x == east && getPos _x distance _pos <= _radius} count allUnits;
    
    hint format["%1", _cntEast];
    
    if(_cntEast <= _minUnits)then{
        _task setTaskState "Succeeded";
        "circle" setMarkerColor "ColorBLUFOR";
        ["TaskSucceeded",["","Säuberung der Stadt"]] call BIS_fnc_showNotification;
    };
    
};