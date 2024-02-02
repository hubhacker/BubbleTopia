class_name Menu
extends Control



@onready var play_button = $MarginContainer/HBoxContainer/VBoxContainer/Play as Button
@onready var exit_button = $MarginContainer/HBoxContainer/VBoxContainer/Quit as Button
@export var start_level = preload("res://routeToJellyCIty (2).tscn") as PackedScene


func _ready():
	play_button.button_down.connect(on_start_pressed)
	exit_button.button_down.connect(on_exit_pressed)


func on_start_pressed() -> void:
	get_tree().change_scene_to_packed(start_level)


func on_exit_pressed() -> void:
	get_tree().quit()
