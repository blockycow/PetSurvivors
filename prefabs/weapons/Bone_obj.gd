extends weapon_obj

var target = Vector2.ZERO

func _physics_process(delta):
	position += direction*speed*delta
	rotation += .1

func enemy_hit(charge = 1):
	var deviation_angle = PI * 0.2
	direction = (direction * -1) + Vector2(randf_range(-deviation_angle,deviation_angle),randf_range(-deviation_angle,deviation_angle))
	hp -= charge
	if hp <= 0:
		emit_signal("remove_from_array",self)
		queue_free()

func set_target(_target):
	direction = global_position.direction_to(_target)
	target = _target
	#rotation = direction.angle() + deg_to_rad(135)
