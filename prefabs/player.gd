extends CharacterBody2D


@export var movement_speed = 60.0
var hp = 80
@export var maxHp = 80
var last_movement = Vector2.UP

var enemy_close = []

var experience = 0
var player_level = 1
var collected_experience = 0

var armor = 0
var speed = 0
var spell_cooldown = 0
var spell_size = 0
var additional_attacks = 0

@onready var sprite = $Sprite
@onready var weapons = $Weapons

signal player_hp_changed(hp, maxHp)
signal player_xp_changed(exp, maxExp)
signal player_levelup(level)
signal upgrade_item(item)

func _ready():
	initialize(GameManager.Pet)

func initialize(petName):
	weapons.equip(PetDb.PETS[petName]["starting_weapon"])
	sprite.texture = load(PetDb.PETS[petName]["sprite"])
	
func _physics_process(delta):
	movement()

func movement():
	var x_mov = Input.get_action_strength("right") - Input.get_action_strength("left")
	var y_mov = Input.get_action_strength("down") - Input.get_action_strength("up")
	var mov = Vector2(x_mov,y_mov)
	if mov.x > 0:
		sprite.flip_h = true
	elif mov.x < 0:
		sprite.flip_h = false

	if mov != Vector2.ZERO:
		last_movement = mov
#		if walkTimer.is_stopped():
#			if sprite.frame >= sprite.hframes - 1:
#				sprite.frame = 0
#			else:
#				sprite.frame += 1
	
	velocity = mov.normalized()*movement_speed
	move_and_slide()
	
func death():
	hp = 0
	pass

func _on_hurt_box_hurt(damage, angle, knockback):
	hp -= clamp(damage-armor, 1.0, 999.0)
	player_hp_changed.emit(hp, maxHp)
	if hp <= 0:
		death()

func _on_grab_area_area_entered(area):
	if area.is_in_group("loot"):
		area.target = self


func _on_collect_area_area_entered(area):
	if area.is_in_group("loot"):
		area.collect()
		var exp = area.experience
		calculate_experience(exp)

func calculate_experience(exp):
	var exp_required = calculate_experiencecap()
	collected_experience += exp
	if experience + collected_experience >= exp_required: #level up
		collected_experience -= exp_required-experience
		player_level += 1
		experience = collected_experience
		exp_required = calculate_experiencecap()
		levelup()
	else:
		experience += collected_experience
		collected_experience = 0
	
	player_xp_changed.emit(experience, exp_required)

func calculate_experiencecap():
	var exp_cap = player_level
	if player_level < 20:
		exp_cap = player_level*5
	elif player_level < 40:
		exp_cap + 95 * (player_level-19)*8
	else:
		exp_cap = 255 + (player_level-39)*12
	return exp_cap

func levelup():
	player_levelup.emit(player_level)

func upgrade_character(item, itemLevel):
	upgrade_item.emit(item)
	if item == "Food":
		if (hp + 20) > maxHp:
			hp = maxHp
		else:
			hp += 20
		player_hp_changed.emit(hp, maxHp)
		return
	
	for equipped_item in weapons.equipped_weapons:
		if equipped_item.name == item:
			equipped_item.upgrade()
			return
	weapons.equip(item)
	
func get_random_target():
	if enemy_close.size() > 0:
		return enemy_close.pick_random().global_position
	else:
		return Vector2.UP

func _on_enemy_detection_area_body_entered(body):
	if not enemy_close.has(body):
		enemy_close.append(body)

func _on_enemy_detection_area_body_exited(body):
	if enemy_close.has(body):
		enemy_close.erase(body)
