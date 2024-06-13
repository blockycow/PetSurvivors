extends Control

@onready var pet_sprite = $SelectedPet

var pets = []
var index = 0

func _ready():
	for pet in PetDb.PETS:
		pets.append(pet)
		
	set_pet(index)


func _on_next_pet_button_pressed():
	index += 1
	if index > pets.size()-1:
		index = 0
		
	set_pet(index)


func _on_previous_pet_button_pressed():
	index -= 1
	if index < 0:
		index = pets.size()-1
	
	set_pet(index)


func set_pet(petIndex):
	pet_sprite.texture = load(PetDb.PETS[pets[petIndex]]["sprite"])
