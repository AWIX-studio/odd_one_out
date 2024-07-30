extends Control

var screen_button
var dialogue_count = 1


func _ready():
	$DialogueBox.data = preload("res://Dialogues/chapter 0.tres")
	$DialogueBox.start('START' + str(dialogue_count))

func _on_dialogue_box_dialogue_ended():
	if dialogue_count == 1:
		$BG/NightPark.texture = preload("res://Textures/BGs/school class evening.png")
	dialogue_count += 1
	$Timer.start(1)


func _on_timer_timeout():
	$DialogueBox.start('START' + str(dialogue_count))
