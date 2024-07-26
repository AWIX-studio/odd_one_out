extends Control

var screen_button
var click_count = 1

func _ready():
	$DialogueBox.start('START' + str(click_count))

func _on_dialogue_box_dialogue_ended():
	click_count += 1
	$Timer.start(1)


func _on_timer_timeout():
	$DialogueBox.start('START' + str(click_count))
