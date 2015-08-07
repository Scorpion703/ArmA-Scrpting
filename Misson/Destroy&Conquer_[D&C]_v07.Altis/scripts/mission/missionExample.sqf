//#####################################################################################
//	Mission Example Script
//	@Autor (S)corpioN. 														@DEUTSCH
//	
//#####################################################################################



while{true} do{

    _circle = createMarker["circle", getMarkerPos "flgg"];
    "circle" setMarkerShape "ELLIPSE";
    "circle" setMarkerSize [10, 10];
    "circle" setMarkerColor "ColorBlack";
    sleep 5;

    task_1 = player createSimpleTask ["TASKNAME"];
    task_1 setSimpleTaskDescription ["TASK DESCRIPTION","Example Task","Move here!"];
    task_1 setSimpleTaskDestination (getMarkerPos "flgg");
    task_1 setTaskState "Assigned";
    ["TaskAssigned",["","Disable the nuke"]] call BIS_fnc_showNotification;
    player setCurrentTask task_1;

    while{taskState task_1 != "Succeeded"}do{
        _meter = player distance getMarkerPos "flgg";
        if(_meter <= 10)then{
            task_1 setTaskState "Succeeded";
            ["TaskSucceeded",["","Move to the Marker"]] call BIS_fnc_showNotification;

        };
        sleep 5;
    };
    
    sleep 20;
};