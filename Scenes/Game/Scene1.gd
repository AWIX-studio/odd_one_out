extends Control

var screen_button
var current_start : String = 'START1'


func _ready():
	$DialogueBox.data = preload("res://Dialogues/chapter 0.tres")
	_select_dialogue(current_start)

func _on_dialogue_box_dialogue_ended():
	pass


func _select_dialogue(_start):
	current_start = _start
	$Timer.start(1)


func _on_timer_timeout():
	$DialogueBox.start(current_start)


func _on_dialogue_box_dialogue_signal(_value):
	if 'START' in _value:
		_select_dialogue(current_start)
