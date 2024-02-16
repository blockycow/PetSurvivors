extends Weapon


@onready var player = get_tree().get_first_node_in_group("player")
@onready var wpn_obj = preload("res://prefabs/knife_obj.tscn")

@onready var cdTimer = get_node("CdTimer")
@onready var attackTimer = get_node("AttackTimer")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.s


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_cd_timer_timeout():
	var attack = wpn_obj.instantiate()
	get_tree().root.get_node("Main").add_child(attack)
	attack.position = player.position
	attack.direction = player.last_movement
	if(attack.direction != Vector2.ZERO):
		attack.rotation = attack.direction.angle()
	
	pass # Replace with function body.
