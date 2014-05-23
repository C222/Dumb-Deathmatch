_player = (_this select 0) select 0;
_killer = (_this select 0) select 1;

_distance = _killer distance _player;
_distance = floor(_distance);

if (_distance > 3000) exitWith {	//Killed while respawning (or when driving over a mine and the killer is over 3km away)
_killerName = name _killer;
	if (isNull _killerName) then {
	[player, nil, rGlobalChat, format["soldier K.I.A."]] call RE;
	} else {
	[player, nil, rGlobalChat, format["got killed by «%1»",name _killer]] call RE;
	};
};

//_distance = format["%1",round(_distance)];
switch (true) do {
	case (_distance < 300) : {	// Close range kills
	_distance = format[" from close range"];};

	case (_distance > 300 && _distance < 800) : { //Show no distance
	_distance = format[""];};

	case (_distance > 800 && _distance < 1500) : {	//Long distance kills
	_distance = format[" over long range"];};

	case (_distance > 1500 && _distance < 3000) : { //Show the distance in meters only for really remarkable long shots
	_distance = format[" from far (%1 meters)",_distance];};

	default {};
};

// Define the name for killer and his weapon
_killerName = name _killer;
_killerWep = currentWeapon _killer;
_weaponName = (configFile >> "cfgWeapons" >> _killerWep);
_weaponName = format["%1",getText(_weaponName >> "displayName")];
_killerWep = format[" with «%1»",_weaponName];


if (_killerName == "ERROR: NO UNIT") exitWith { // Drive a car into a wall/rock etc. or drive over a mine
[player, nil, rGlobalChat, format["should learn how to drive"]] call RE;
};
if (_weaponName == "HORN") exitWith { // Same as before, but different (suitable for passengers)
[player, nil, rGlobalChat, format["died in a tragic car accident"]] call RE;
};

if (side _killer == Civilian) exitWith {
	if (_player == _killer) then { // Respawn suicide or killed by a explosion of a vehicle
	[player, nil, rGlobalChat, format["soldier K.I.A."]] call RE;
	} else { //AI Kill (not always AI so I removed the "AI" from the killmessage)
	[player, nil, rGlobalChat, format["killed by «%1»%2%3",name _killer,_distance,_killerWep]] call RE;
	};
};

if(_player == _killer) then { //Suicide - Might be obsolete since respawning suicide get's catched in the "Civilian" section
[player, nil, rGlobalChat, format["soldier K.I.A."]] call RE;
} else { //Normal kill - Player kills Player with a weapon
[player, nil, rGlobalChat, format["got killed by «%1»%2%3",name _killer,_distance,_killerWep]] call RE;
};
