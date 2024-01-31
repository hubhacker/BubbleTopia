extends CharacterBody2D

const SPEED = 0 # Shark doesn't move
var current_state = IDLE
var is_chatting = false
var player_in_chat_zone = false
var dialogue_index = 0
var player_name = ""

enum {
	IDLE,
	NEW_DIR,
	MOVE
}

func _ready():
	randomize()

func _process(delta):
	# Shark does nothing in _process since it doesn't move
	pass

func _on_ChatZone_body_entered(body):
	if body.is_in_group("player"):
		player_in_chat_zone = true
		start_dialogue()

func _on_ChatZone_body_exited(body):
	if body.is_in_group("player"):
		player_in_chat_zone = false

func start_dialogue():
	is_chatting = true
	var dialogue = [
		"Oh no, a shark is approaching! What do I do?!?",
		"Hello human, can you please please help me?", # Shark's dialogue
		"Of course shark! *sigh of relief*", # User's response
		"Thank you so so much, human!", # Shark's response
		"No problem shark! By the way, what is your name?", # User's question
		"I am Cici! What’s your name human?", # Shark's response
		"I love love love your name! Where are you headed to?", # Shark's question
		"I am going to Jelly City!", # User's response
		"Omg, I have friends in Jelly City, I can take you there!", # Shark's response
		"Really? Thanks so much!" # User's response
	]
	display_dialogue(dialogue[dialogue_index])

func display_dialogue(text):
	# Implement your dialogue display logic, e.g., using a dialog box or text label
	# For simplicity, let's assume we print the dialogue to the console
	print(text)
	if dialogue_index == 4:
		# This is the point where the game asks the player to enter their name
		# Simulating player input by setting a predetermined name
		player_name = "Scuba" # This can be replaced with actual user input
		print("Player's name: " + player_name)
	elif dialogue_index == 7:
		# This is where the user responds with their destination
		print("Player's destination: Jelly City")
	elif dialogue_index == 9:
		# This is where the dialogue ends, and the shark decides to follow the player
		follow_player()

	dialogue_index += 1

func follow_player():
	# Implement logic for the shark to follow the player to the next scene
	# In this case, since we're transitioning to the next scene,
	# you can use code to load the jelly_city.tscn scene here
	# Example:
	get_tree().change_scene("res://jelly_city.tscn")
	#pass
