extends CharacterBody2D

@onready var anim = $AnimatedSprite2D
@export var follow_speed = 300;
@export var follow_distance = 50;

func _ready():
	randomize()
	anim.play("idle")
	
enum {
	IDLE,
	NEW_DIR,
	MOVE
}

const speed = 30
var current_state = IDLE
var dir = Vector2.RIGHT

func _process(delta):
	match current_state:
		IDLE:
			pass
		NEW_DIR:
			dir = choose([Vector2.RIGHT, Vector2.UP, Vector2.LEFT, Vector2.DOWN])
		MOVE:
			move(delta)
			
func move(delta):
	position += dir * speed * delta
	
func choose(array):
	array.shuffle()
	return array.front()
	
func _on_Timer_timeout():
	$Timer.wait_time = choose( [0.5, 1, 1.5])
	current_state = choose([IDLE, NEW_DIR, MOVE])

func follow(whatToFollow):
	if global_position.distance_to(whatToFollow.global_position)< follow_distance:
		var distance : Vector2 = (whatToFollow.global_position - global_position)
		move_and_slide((follow_speed*distance.normalized())
