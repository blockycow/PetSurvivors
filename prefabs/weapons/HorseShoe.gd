extends Weapon

@onready var wpn_obj = preload("res://prefabs/weapons/HorseShoe_obj.tscn")

func _on_cd_timer_timeout():
	ammo = base_ammo + player.additional_attacks
	attackTimer.start()


func _on_attack_timer_timeout():
	if ammo > 0:
		var attack = wpn_obj.instantiate()
		attack.set_stats(self)
		get_tree().root.get_child(0).add_child(attack)
		attack.position = player.position
		attack.set_target(player.get_random_target())
		if(attack.direction != Vector2.ZERO):
			attack.rotation = attack.direction.angle()
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
			base_ammo += 1
			damage += 5
	
