extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	$DialogueBox.data = preload("res://Test/Dialogues/2.tres")
	$DialogueBox.start('START')
