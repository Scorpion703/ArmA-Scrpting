//#####################################################################################
//	Missionsbriefing
//	@Autor (S)corpioN. 														@DEUTSCH
//	
//#####################################################################################


//execVM "briefing.sqf";

nul = [] execVM "spawnHouseScript.sqf";
//nul = [] execVM "weather.sqf";
nul = [getMarkerPos "flgg", 25] execVM "capturePoint.sqf";