extends weapon_obj

func _physics_process(delta):
	position += direction*speed*delta


func enemy_hit(charge = 1):
	hp -= charge
	if hp <= 0:
		emit_signal("remove_from_array",self)
		queue_free()
