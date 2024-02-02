extends Sprite2D

var sprite : Sprite2D

func _ready():
	# Use the path to reference the Sprite node
	if has_node("Sprite"):
		sprite = $Sprite
		if sprite != null:
			print("Sprite node found and assigned.")
		else:
			print("Error: Node 'Sprite' is null.")
	else:
		print("Error: Node 'Sprite' not found under 'CharacterBody2D'")

func _process(delta):
	# Check if the "P" key is pressed
	if (global.found_jelly_item == true) and sprite != null:
		sprite.visible = false
	else:
		sprite.visible = true
