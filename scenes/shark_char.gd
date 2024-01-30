extends CharacterBody2D

# Constants and Variables
const IDLE = 0
var current_state = IDLE

func _ready():
	# Initial setup if needed
	pass

func _process(delta):
	match current_state:
		IDLE:
			$AnimatedSprite2D.play("idle")
