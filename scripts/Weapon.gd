extends Node2D
class_name Weapon

@onready var player = get_tree().get_first_node_in_group("player")

@onready var cdTimer = get_node("CdTimer")
@onready var attackTimer = get_node("AttackTimer")


var level = 1
var ammo = 0

@export var hp = 1
@export var speed = 100
@export var damage = 5
@export var knockback_amount = 100
@export var weapon_size = 1.0
@export var base_ammo = 1
@export var lifetime = 3


func upgrade():
	level += 1
