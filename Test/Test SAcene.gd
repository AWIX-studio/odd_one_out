extends Control

@onready var dial_box = $DialogueBox

func _on_button_pressed():
	dial_box.start('Dialogue1')
