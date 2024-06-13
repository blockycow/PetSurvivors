extends Node

const ICON_PATH = "res://assets/Weapons/"
const WEAPON_PATH = "res://prefabs/weapons/"

const UPGRADES = {
	"Feather": {
		"icon": ICON_PATH + "Feather.png",
		"display_name": "Feather",
		"type": "weapon",
		1: {
			"details": "Shoot feathers out in front of you."
		},
		2: {
			"details": "An additional feather is thrown."
		},
		3: {
			"details": "Shoot another additional feather. Feathers deal +5 damage."
		}
	},
	"Bone": {
		"icon": ICON_PATH + "Bone.png",
		"display_name": "Bone",
		"type": "weapon",
		1: {
			"details": "Throw a bouncing bone at a random enemy."
		},
		2: {
			"details": "An additional bone is thrown."
		},
		3: {
			"details": "Bones bounce one additional time and deal +3 damage."
		}
	},
	"Claw": {
		"icon": ICON_PATH + "Claw.png",
		"display_name": "Claw",
		"type": "weapon",
		1: {
			"details": "Claw a random enemy close to you."
		},
		2: {
			"details": "Increase claw damage +10."
		},
		3: {
			"details": "Increase claw size."
		}
	},
	"Venom": {
		"icon": ICON_PATH + "Venom.png",
		"display_name": "Venom",
		"type": "weapon",
		1: {
			"details": "leave a trail of venom behind you."
		},
		2: {
			"details": "Venom stays slightly longer."
		},
		3: {
			"details": "Venom is increased in size."
		}
	},
	"SpikyShell": {
		"icon": ICON_PATH + "SpikyShell.png",
		"display_name": "Spiky Shell",
		"type": "weapon",
		1: {
			"details": "Damage enemies that get close."
		},
		2: {
			"details": "Increase damage by +1."
		},
		3: {
			"details": "Increase knockback slightly."
		}
	},
	"HorseShoe": {
		"icon": ICON_PATH + "HorseShoe.png",
		"display_name": "Horse Shoe",
		"type": "weapon",
		1: {
			"details": "Throw out a horse shoe to the closest enemy."
		},
		2: {
			"details": "Increase the size slightly."
		},
		3: {
			"details": "Increase the damage by +3."
		}
	},
	"Bubble": {
		"icon": ICON_PATH + "Bubble.png",
		"display_name": "Bubble",
		"type": "weapon",
		1: {
			"details": "Throw a slow bubble in a random direction."
		},
		2: {
			"details": "Throw an additional bubble."
		},
		3: {
			"details": "Increase the size and attack speed slightly."
		}
	},
	"Food": {
		"icon": ICON_PATH + "Treat.png",
		"display_name": "Food",
		"type": "food",
		1: {
			"details": "Heals 20 Hp."
		},
	}
}

