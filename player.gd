extends CharacterBody2D

@onready var anim = $AnimatedSprite2D
var jelly_in_range = false
const max_speed = 400
const accel = 1500
const friction = 600

var input = Vector2.ZERO

func _ready():
	anim.play("idle")

#func _input(event: InputEvent):
	## check if a dialog is already running
	#if Dialogic.current_timeline != null:
		#return
#
	#if event is InputEventKey and event.keycode == KEY_ENTER and event.pressed:
		#Dialogic.start('chapterA')
		#get_viewport().set_input_as_handled()

func _physics_process(delta):
	player_movement(delta)
	if jelly_in_range == true:
		if Input.is_action_just_pressed("ui_accept"):
			DialogueManager.show_example_dialogue_balloon(load("res://main.dialogue"), "scene1")
			return
	
func get_input():
	input.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	input.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	return input.normalized()
	
func _on_detection_area_body_entered(body):
	if body.has_method("jelly"):
		jelly_in_range = true
func _on_detection_area_body_exited(body):
	if body.has_method("enemy"):
		jelly_in_range = false
	
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
	
