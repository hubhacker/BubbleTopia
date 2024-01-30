extends Character Body 2D

const speed = 30
var current_state = IDLE

var dir = Vector2.RIGHT
var start_pos

var is_roaming = true
var is_chatting = false

var player
var player_in_chat_zone = false

enum {
	IDLE,
	NEW_DIR,
	MOVE,
	CHATTING
}
func _ready():
	randomized()
	start_pos = position
	chat_zone.connect("body_entered", self, "_on_ChatZone_body_entered")
	chat_zone.connect("body_exited", self, "_on_ChatZone_body_exited")

func _process(delta):
	match current_state:
		IDLE, NEW_DIR:
			$AnimatedSprite2D.play("idle")
		MOVE:
			if dir.x == -1 and not is_chatting:
				$AnimatedSprite2D.play("approach")
		CHATTING:
			# Logic for chatting
			pass

func _on_ChatZone_body_entered(body):
	if body.name == "Player":  # Replace with the actual name of your player node
		is_chatting = true
		current_state = CHATTING
		start_conversation()  # This is a custom function to handle conversation start

func _on_ChatZone_body_exited(body):
	if body.name == "Player":
		is_chatting = false
		end_conversation()
