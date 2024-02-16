extends CharacterBody2D


@export var movement_speed = 60.0
var hp = 80
var maxhp = 80
var last_movement = Vector2.UP

var armor = 0
var speed = 0
var spell_cooldown = 0
var spell_size = 0
var additional_attacks = 0


@onready var sprite = $Sprite

func _physics_process(delta):
	movement()

func movement():
	var x_mov = Input.get_action_strength("right") - Input.get_action_strength("left")
	var y_mov = Input.get_action_strength("down") - Input.get_action_strength("up")
	var mov = Vector2(x_mov,y_mov)
	if mov.x > 0:
		sprite.flip_h = false
	elif mov.x < 0:
		sprite.flip_h = true

	if mov != Vector2.ZERO:
		last_movement = mov
#		if walkTimer.is_stopped():
#			if sprite.frame >= sprite.hframes - 1:
#				sprite.frame = 0
#			else:
#				sprite.frame += 1
	
	velocity = mov.normalized()*movement_speed
	move_and_slide()
