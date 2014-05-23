weps = ["RPG7V", "m107", "GAU12", "M256", "YakB"];
ammos = ["PG7V", "10Rnd_127x99_M107", "300Rnd_25mm_GAU12", "20Rnd_120mmHE_M1A2", "1470Rnd_127x108_YakB"];
{
	if(_x getVariable ["give_gun", false]) then
	{
		if(_x isKindOf "Land") then
			{
				idx = floor(random ((count weps)-2))+2
			} else {
				idx = floor(random 2)
			};
			the_wep = weps select idx;
			the_ammo = ammos select idx;
			_x addWeapon the_wep;
			for "_i" from 0 to floor(random 10) do
			{
				_x addMagazine the_ammo;
			};
			_x setVariable ["give_gun", false];
			_x vehicleChat "Gave "+the_wep;
			_x selectWeapon the_wep; 
			reload _x;
	};
} forEach _this;