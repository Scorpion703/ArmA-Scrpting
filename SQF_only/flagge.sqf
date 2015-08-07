//#####################################################################################
//	Flaggen Script
//	@Autor (S)corpioN. 														@DEUTSCH
//	
//#####################################################################################


/*_pos = _this select 0;
_radius = _this select 1;*/

flagge = "black";


_circle = createMarker["circle", getMarkerPos "flgg"];
"circle" setMarkerShape "ELLIPSE";
"circle" setMarkerSize [50, 50];
"circle" setMarkerColor "ColorBlack";

_ring = createMarker["ring", getMarkerPos "flgg"];
"ring" setMarkerShape "ELLIPSE";
"ring" setMarkerSize [50, 50];
"ring" setMarkerBrush "Border";
"ring" setMarkerColor "ColorBlack";

_tickWest = 0;
_tickEast = 0;
_tickGuer = 0;

while{true}do{
    _cntWest = {alive _x && side _x == west && getPos _x distance getMarkerPos "flgg" <= 50} count allUnits; 
    _cntEast = {alive _x && side _x == east && getPos _x distance getMarkerPos "flgg" <= 50} count allUnits; 
    _cntGuer = {alive _x && side _x == resistance && getPos _x distance getMarkerPos "flgg" <= 50} count allUnits;
    
    
    /*
        Erst wird geprüft ob eine Fraktion die mehrzahl im gebiet hat. 
        wenn ja dann werden erst die feindtickets herabgezählt bevor die anderen tickets aufgezählt werden.
    */
    if(_cntWest > _cntEast && _cntWest > _cntGuer)then{
        "ring" setMarkerColor "ColorBlue";
        if(_tickEast > 0)then{
            _tickEast = _tickEast - 2;
        }else{
            if(_tickGuer > 0)then{
                _tickGuer = _tickGuer - 2;
            }else{
                if(_tickWest < 100)then{
                    _tickWest = _tickWest + 2;
                };
            };
        };
        
    }else{
        if(_cntEast > _cntWest && _cntEast > _cntGuer)then{
            "ring" setMarkerColor "ColorRed";
            if(_tickWest > 0)then{
                _tickWest = _tickWest - 2;
            }else{
                if(_tickGuer > 0)then{
                    _tickGuer = _tickGuer - 2;
                }else{
                    if(_tickEast < 100)then{
                        _tickEast = _tickEast + 2;
                    };
                };
            };
            
        }else{
            if(_cntGuer > _cntWest && _cntGuer > _cntEast)then{
                "ring" setMarkerColor "ColorGreen";
                if(_tickWest > 0)then{
                    _tickWest = _tickWest - 2;
                }else{
                    if(_tickEast > 0)then{
                        _tickEast = _tickEast - 2;
                    }else{
                        if(_tickGuer < 100)then{
                            _tickGuer = _tickGuer + 2;
                        };  
                    };
                };
            }else {
                 "ring" setMarkerColor "ColorBlack";
            };
        };
    };
    
    
    /*
    Rückgabewert generieren.
    Wenn Flagge BLUFOR eingenommen hat dann return "blue"
    wenn flagge OPFOR eingenommen hat dann return "red"
    wenn flagge GUERILLA eingenommen hat dann return "green
    */
    
    if(_tickWest == 100)then{
        flagge = "blue";
        "circle" setMarkerColor "ColorBLUFOR";
    }else{
        if(_tickEast == 100)then{
            flagge == "red";
            "circle" setMarkerColor "ColorOPFOR";
        }else{
            if(_tickGuer == 100)then{
                flagge == "green";
                "circle" setMarkerColor "ColorIndependent";
            }else{
                flagge == "black";
                "circle" setMarkerColor "ColorBlack";
            };
        };
    };
    
    hintSilent format["West: %1 \nEast: %2 \nGuer: %3", _tickWest, _tickEast, _tickGuer];
    
    sleep 2;
};