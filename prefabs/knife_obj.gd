extends weapon_obj

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	position += direction*speed*delta

func _on_destroy_timer_timeout():
	queue_free()

func enemy_hit(charge = 1):
	hp -= charge
	if hp <= 0:
		queue_free()
