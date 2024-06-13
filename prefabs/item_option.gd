extends ColorRect

@onready var name_lbl = $NameLabel
@onready var desc_lbl = $DescriptionLabel
@onready var lvl_lbl = $LevelLabel
@onready var item_icon = $ItemBg/ItemIcon


var mouse_over = false
var item = null
var itemLevel = 1
@onready var player = get_tree().get_first_node_in_group("player")

signal selected_upgrade(upgrade)

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("selected_upgrade",Callable(player,"upgrade_character"))
	if item == null:
		item = "Food"
	name_lbl.text = UpgradeDb.UPGRADES[item]["display_name"]
	item_icon.texture = load(UpgradeDb.UPGRADES[item]["icon"])
	for equipped_item in player.weapons.equipped_weapons:
		if equipped_item.name == item:
			desc_lbl.text = UpgradeDb.UPGRADES[item][equipped_item.level+1]["details"]
			lvl_lbl.text = str(equipped_item.level+1)
			return
	desc_lbl.text = UpgradeDb.UPGRADES[item][1]["details"]
	lvl_lbl.text = "1"
			

func _input(event):
	if event.is_action_released("click"):
		if mouse_over:
			emit_signal("selected_upgrade",item, itemLevel)

func _on_mouse_entered():
	mouse_over = true

func _on_mouse_exited():
	mouse_over = false
