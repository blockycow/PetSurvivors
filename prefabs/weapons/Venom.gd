extends Weapon

@onready var wpn_obj = preload("res://prefabs/weapons/Venom_obj.tscn")

var last_spawn_pos = Vector2.ZERO

func _on_cd_timer_timeout():
	if last_spawn_pos == player.position:
		return
	
	var attack = wpn_obj.instantiate()
	attack.set_stats(self)
	get_tree().root.get_child(0).add_child(attack)
	attack.position = player.position
	attack.direction = player.last_movement
	last_spawn_pos = player.position
	

func upgrade():
	level += 1
	match level:
		2:
			lifetime += 1
		3:
			weapon_size += 0.15
	
