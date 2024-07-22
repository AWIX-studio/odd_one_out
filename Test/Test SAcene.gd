extends Control

@onready var dial_box = $DialogueBox

func _on_button_pressed():
	dial_box.start('START')


func _on_dialogue_box_option_selected(idx):
	print($DialogueBox.get_child(1))
