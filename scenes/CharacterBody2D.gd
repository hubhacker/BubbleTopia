extends CharacterBody2D

@onready var anim = $AnimatedSprite2D
@onready var actionable_finder: Area2D = $Direction/ActionableFinder

func _ready():
	anim.play("default")
	
@export var speed : int = 65

func handleInput():
	var moveDirection = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = moveDirection*speed
	if Input.is_action_just_pressed("ui_accept"):
		var actionables = actionable_finder.get_overlapping_areas()
		if actionables.size() > 0:
			actionables[0].action()
			return

func _physics_process(delta):
	handleInput()
	move_and_slide()
