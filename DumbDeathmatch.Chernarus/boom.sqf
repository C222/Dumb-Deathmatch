/**
* Generated by LEA for Arma 2 Combined Operation & ACE 2
* Version: 1.4.74
* Sun Feb 16 23:30:22 PST 2014
* 
* Call the script: _dummy = this execvm "boom.sqf";
* 
*/


while {true} do {
 if isnull _this exitwith {};
 if not alive _this exitwith {};
 clearweaponcargo _this;
 clearmagazinecargo _this;

 _this addweaponcargo ["RPG7V",1];
 _this addmagazinecargo ["HandGrenade_East",5];
 _this addmagazinecargo ["HandGrenade",5];
 _this addmagazinecargo ["SmokeShell",100];
 _this addmagazinecargo ["PG7V",2];

 sleep 600;
};