extends weapon_obj

var target = Vector2.ZERO

func _physics_process(delta):
	position += direction*speed*delta
	rotation += .1
	speed -= 100*delta

func set_target(_target):
	direction = global_position.direction_to(_target)
	target = _target
	#rotation = direction.angle() + deg_to_rad(135)
