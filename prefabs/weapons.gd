extends Node2D

var equipped_weapons = []

signal on_equip(weapon)

func equip(weaponName):
	var weapon = load(UpgradeDb.WEAPON_PATH + weaponName + ".tscn")
	var weapon_obj = weapon.instantiate()
	add_child(weapon_obj)
	equipped_weapons.append(weapon_obj)
	on_equip.emit(weapon_obj)
