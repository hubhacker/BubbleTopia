extends CharacterBody2D

const max_speed = 20
const accel = 10
const friction = 10

var input = Vector2.ZERO

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

#
#var speed = 80.0
#
#func _physics_process(delta):
	#var velocity = Vector2.ZERO
	#if Input.is_action_pressed("ui_right"):
		#velocity.x += 1.0
	#if Input.is_action_pressed("ui_left"):
		#velocity.x-= 1.0
	#if Input.is_action_pressed("ui_down"):
		#velocity.y += 1.0
	#if Input.is_action_pressed("ui_up"):
		#velocity.y -= 1.0
#
#move_and_slide()
