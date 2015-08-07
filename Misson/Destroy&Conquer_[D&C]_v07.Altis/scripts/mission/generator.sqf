//#####################################################################################
//	Unit Spawn Script
//	@Autor (S)corpioN. 														@DEUTSCH
//	nul = []execVM "missionGenerator.sqf"
//#####################################################################################



//################################# CITIES ############################################

_villages = nearestLocations [[0,0,0], ["NameVillage"], 50000];
_cities = nearestLocations [[0,0,0], ["NameCity"], 50000];
_capitalCities = nearestLocations [[0,0,0], ["NameCityCapital"], 50000];


//################################# OPFOR #############################################

_slaInfantry = ["LOP_SLA_Infantry_AA", "LOP_SLA_Infantry_AT", "LOP_SLA_Infantry_Engineer",
                "LOP_SLA_Infantry_GL", "LOP_SLA_Infantry_Marksman", "LOP_SLA_Infantry_MG",
                "LOP_SLA_Infantry_Officer", "LOP_SLA_Infantry_Rifleman", "LOP_SLA_Infantry_SL",
                "LOP_SLA_Infantry_TL"];

_slaCars = ["LOP_SLA_UAZ", "LOP_SLA_UAZ_Open", "LOP_SLA_Ural", "LOP_SLA_Ural_Open"];

_slaTanks = ["LOP_SLA_BM21", "LOP_SLA_BMP1", "LOP_SLA_BMP1D", "LOP_SLA_BMP2", "LOP_SLA_BMP2D", 
             "LOP_SLA_BTR60", "LOP_SLA_BTR70", "LOP_SLA_T72BA", "LOP_SLA_T72BB"];

//################################# INDPE #############################################

_isisCars = ["LOP_ISTS_M1025_D", "LOP_ISTS_M1025_W_M2", "LOP_ISTS_M1025_W_Mk19", "LOP_ISTS_Offroad",
            "LOP_ISTS_Offroad_M2", "LOP_ISTS_Truck", "LOP_ISTS_LandRover", "LOP_ISTS_Landrover_M2"];

_isisInfantries = ["LOP_ISTS_Infantry_AR", "LOP_ISTS_Infantry_AT", "LOP_ISTS_Infantry_Corpsman",
                 "LOP_ISTS_Infantry_Engineer", "LOP_ISTS_Infantry_GL", "LOP_ISTS_Infantry_Marksman",
                 "LOP_ISTS_Infantry_Rifleman", "LOP_ISTS_Infantry_SL", "LOP_ISTS_Infantry_TL"];

//#####################################################################################


//MAIN!
_i = 0; //für markernamen
while{true}do{
    
    _villageCount = count _villages;
    _cityCount = count _cities;
    _capCityCount = count _capitalCities;
    /*
    an die Position zu kommen:
    position (_villages select _x)
    */
    
    //MarkerNamen Generieren--------------------------
    _markerName = format["mrk%1", _i];
    //------------------------------------------------
    
    
    if(2 == 1)then{
        //hauptstadt
        
    }else{
        if(1 == 1)then{
            //kleinstadt
            
            //stadt auswählen udn aus städte schmeißen
            _city = _cities call BIS_fnc_selectRandom;
            _cities = _cities - [_city];
            
            //bevor mission erstellt wird einheiten spawnen
            nul = [round (random 5)+5, (position _city), 250, _slaInfantry]execVM "scripts\mission\unitSpawn.sqf";
            nul = [round (random 5)+5, (position _city), 250, _slaTanks]execVM "scripts\mission\tankSpawn.sqf";
            
            _script_handler = [(position _city), 250, 2, _markerName]execVM "scripts\mission\clearing.sqf";
            waitUntil { scriptDone _script_handler };
            
        }else{
            //dorf
        };
        
    };
    
    sleep 3;
    
    hint "mission Generator DONE!!!";
    _i = _i+1
};