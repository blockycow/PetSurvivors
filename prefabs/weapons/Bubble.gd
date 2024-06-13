extends Weapon

@onready var wpn_obj = preload("res://prefabs/weapons/Bubble_obj.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	print("upgraded: " + name)

func _on_cd_timer_timeout():
	ammo = base_ammo + player.additional_attacks
	attackTimer.start()


func _on_attack_timer_timeout():
	if ammo > 0:
		var attack = wpn_obj.instantiate()
		attack.set_stats(self)
		get_tree().root.get_child(0).add_child(attack)
		attack.position = player.position
		attack.direction = Vector2(randf_range(-1, 1), randf_range(-1, 1))
		ammo -= 1
		if ammo > 0:
			attackTimer.start()
		else:
			attackTimer.stop()

func upgrade():
	level += 1
	match level:
		2:
			base_ammo += 1
		3:
			weapon_size += 0.1
			cdTimer.wait_time *= 0.95

