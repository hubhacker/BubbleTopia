extends CanvasLayer

const CHAR_READ_RATE = 0.05

@onready var textbox_container = $LabelContainer
@onready var label = $LabelContainer/MarginContainer/HBoxContainer/Label

func _ready():
	hide_textbox() 
	add_text("This text is going to be added")
	
func hide_textbox():
	label.text = ""
	textbox_container.hide()
	
func show_textbox():
	textbox_container.show()
	
func add_text(next_text):
	label.text = next_text
	show_textbox()
	
	var tween = get_tree().create_tween()
	#tween.interpolate_value(label, "visible_characters", 0.0, 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	#tween.tween_property(label, "visible_characters", 0.0, 1.0).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_OUT)
	#len(next_text) * CHAR_READ_RATE
	#tween.tween_property(label, "display_text", 0.0,1.0, len(next_text) * CHAR_READ_RATE,Tween.TRANS_LINEAR,Tween.EASE_OUT)
	tween.tween_property(label, "visible_ratio", 1.0, len(next_text)*CHAR_READ_RATE)
	tween.connect("finished", Tween.on_tween_finished)
	tween.play()
