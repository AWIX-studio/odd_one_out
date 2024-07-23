extends Control

var screen_button
var click_count = 0

func _ready():
	screen_button = $Button

func _on_button_pressed():
	if click_count == 0:
		remove_child(screen_button)
		$DialogueBox.start("START")
	elif click_count == 1:
		remove_child(screen_button)
		$DialogueBox.start("START2")


func _on_dialogue_box_dialogue_ended():
	add_child(screen_button)
	
