extends Node2D

@onready var pet_selection = $CanvasLayer/Control/PetSelection

func _on_start_button_pressed():
	GameManager.Pet = pet_selection.pets[pet_selection.index]
	get_tree().change_scene_to_file("res://main.tscn")
