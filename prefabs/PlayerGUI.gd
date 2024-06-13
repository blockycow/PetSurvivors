extends Control
var itemContainer = preload("res://prefabs/item_container.tscn")
var itemOption = preload("res://prefabs/item_option.tscn")
@onready var player = get_tree().get_first_node_in_group("player")

@onready var healthBar = get_node("%HealthBar")
@onready var expBar = get_node("%ExperienceBar")
@onready var levelLabel = get_node("%LevelLabel")
@onready var weaponContainers = get_node("%WeaponContainers")
@onready var levelupPanel = get_node("%LevelUpPanel")
@onready var upgradeOptions = get_node("%UpgradeOptions")

var items = []
var weaponOptions = []
var levelUpCounter = 0

func _on_player_hp_changed(hp, maxHp):
	healthBar.max_value = maxHp
	healthBar.value = hp


func _on_weapons_on_equip(weapon):
	for container in items:
		if container.weapon == weapon:
			return
		
	var newItem = itemContainer.instantiate()
	newItem.set_icon(weapon)
	weaponContainers.add_child(newItem)
	items.append(newItem)

func _on_player_levelup(level):
	if levelupPanel.visible:
		levelUpCounter += 1
		return
	
	levelLabel.text = "Level: " + str(level)
	levelupPanel.visible = true
	
	var options = 0
	while options < 3:
		var option_choice = itemOption.instantiate()
		option_choice.item = get_random_item()
		upgradeOptions.add_child(option_choice)
		options += 1
	get_tree().paused = true

func _on_player_xp_changed(exp, maxExp):
	set_expbar(exp, maxExp)

func set_expbar(set_value = 1, set_max_value = 100):
	expBar.value = set_value
	expBar.max_value = set_max_value

func get_random_item():
	var dbList = []
	for db_weapon in UpgradeDb.UPGRADES:
		var valid_weapon = true
		if db_weapon in weaponOptions:
			continue
		elif UpgradeDb.UPGRADES[db_weapon]["type"] == "food": #Don't pick food
			continue
		for equipped_weapon in player.weapons.equipped_weapons:
			if db_weapon == equipped_weapon.name:
				if equipped_weapon.level < 3:
					dbList.append(db_weapon)
				else:
					valid_weapon = false
		if db_weapon in dbList or valid_weapon == false:
			continue
		else:
			dbList.append(db_weapon)
	if dbList.size() > 0:
		var randomItem = dbList.pick_random()
		weaponOptions.append(randomItem)
		return randomItem
	else:
		return null


func _on_player_upgrade_item(item):
	var option_children = upgradeOptions.get_children()
	for child in option_children:
		child.queue_free()
	weaponOptions.clear()
	levelupPanel.visible = false
	get_tree().paused = false
	
	if levelUpCounter > 0:
		levelUpCounter -= 1 
		_on_player_levelup(player.player_level)
		
