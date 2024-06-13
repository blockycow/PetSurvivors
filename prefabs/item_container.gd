extends TextureRect

var weapon = null

func set_icon(_weapon):
	weapon = _weapon
	$ItemTexture.texture = load(UpgradeDb.UPGRADES[weapon.name]["icon"])
