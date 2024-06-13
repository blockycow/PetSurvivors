extends Sprite2D

@onready var timer = $HurtTimer

func _on_hurt_box_hurt(damage, angle, knockback_amount):
	modulate = Color(1,0,0)
	timer.start()



func _on_hurt_timer_timeout():
	modulate = Color(1,1,1)
