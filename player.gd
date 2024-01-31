extends CharacterBody2D

const max_speed = 600
const accel = 1500
const friction = 600

@onready var anim = $AnimatedSprite2D

var input = Vector2.ZERO

<<<<<<< HEAD
func _ready():
	anim.play("idle")

=======
#func _input(event: InputEvent):
	## check if a dialog is already running
	#if Dialogic.current_timeline != null:
		#return
#
	#if event is InputEventKey and event.keycode == KEY_ENTER and event.pressed:
		#Dialogic.start('chapterA')
		#get_viewport().set_input_as_handled()
>>>>>>> 279f0c7f28d7b2c1401183ee9e083d53e2d3efea

func _physics_process(delta):
	player_movement(delta)
	
func get_input():
	input.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	input.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	return input.normalized()
	
	
func player_movement(delta):
	input = get_input()
	
	if input == Vector2.ZERO:
		if velocity.length() > (friction * delta):
			velocity -= velocity.normalized() * (friction * delta)
		else:
			velocity = Vector2.ZERO
	else:
		velocity += (input * accel * delta)
		velocity = velocity.limit_length(max_speed)
		
	move_and_slide()
	
