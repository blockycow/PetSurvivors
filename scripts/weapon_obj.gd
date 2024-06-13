extends Area2D
class_name weapon_obj

var level = 1
var hp = 1
var speed = 100
var damage = 5
var knockback_amount = 100
var weapon_size = 1.0
var lifetime = 3

var direction = Vector2.ZERO

signal remove_from_array(object)

@onready var player = get_tree().get_first_node_in_group("player")

func enemy_hit(charge = 1):
	hp -= charge

func set_stats(weapon):
	hp = weapon.hp
	level = weapon.level
	speed = weapon.speed
	damage = weapon.damage
	knockback_amount = weapon.knockback_amount
	lifetime = weapon.lifetime
	scale = Vector2(weapon.weapon_size,weapon.weapon_size)
