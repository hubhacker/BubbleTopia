extends CharacterBody2D

@onready var anim = $AnimatedSprite2D

func _ready():
	anim.play("default")
	
@export var speed : int = 65

func handleInput():
	var moveDirection = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = moveDirection*speed

func _physics_process(delta):
	handleInput()
	move_and_slide()
