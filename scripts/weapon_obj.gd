extends Area2D
class_name weapon_obj

var level = 1
var hp = 1
var speed = 100
var damage = 5
var knockback_amount = 100
var weapon_size = 1.0
var base_ammo = 0

var direction = Vector2.ZERO

var ammo = 0


@onready var player = get_tree().get_first_node_in_group("player")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func enemy_hit(charge = 1):
	hp -= charge
