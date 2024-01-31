extends CharacterBody2D

@onready var anim = $AnimatedSprite2D

func _ready():
	anim.play("default")
	
@export var speed : int = 65

func handleInput():
	var moveDirection = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = moveDirection*speed
	
	if Input.is_action_just_pressed("ui_accept"):
		DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/main.dialogue"), "scene1")
		return

func _physics_process(delta):
	handleInput()
	move_and_slide()
