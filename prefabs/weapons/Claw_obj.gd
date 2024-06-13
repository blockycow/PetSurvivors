extends weapon_obj

var target = Vector2.ZERO

func enemy_hit(charge = 1):
	if hp <= 0:
		emit_signal("remove_from_array",self)
		queue_free()
