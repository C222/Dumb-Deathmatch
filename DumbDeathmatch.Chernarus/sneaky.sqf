/**
* Generated by LEA for Arma 2 Combined Operation & ACE 2
* Version: 1.4.74
* Sun Feb 16 23:32:07 PST 2014
* 
* Call the script: _dummy = this execvm "sneaky.sqf";
* 
*/


while {true} do {
 if isnull _this exitwith {};
 if not alive _this exitwith {};
 clearweaponcargo _this;
 clearmagazinecargo _this;

 _this addweaponcargo ["MakarovSD",10];
 _this addweaponcargo ["bizon_silenced",1];
 _this addweaponcargo ["Binocular",5];
 _this addmagazinecargo ["8Rnd_9x18_MakarovSD",100];
 _this addmagazinecargo ["64Rnd_9x19_SD_Bizon",6];

 sleep 600;
};
