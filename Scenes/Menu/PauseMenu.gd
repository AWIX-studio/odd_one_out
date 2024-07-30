extends Control

func _ready():
	hide()

var is_animation_playing = false
var is_paused = false

func _input(event):
	if Input.is_action_pressed('pause') and not is_animation_playing:
		if is_paused:
			pause_hide()
		elif not self.visible:
			pause_show()

func pause_show():
	is_paused = true
	show()
	$AnimationPlayer.play("appearance of a pause")
	is_animation_playing = true
	$Timer.start(0.5)

func pause_hide():
	is_paused = false
	$AnimationPlayer.play("disappearance of pause")
	is_animation_playing = true
	$Timer.start(0.5)

func _on_timer_timeout():
	if not is_paused:
		hide()
	is_animation_playing = false

func _on_resume_pressed():
	pause_hide()

func _on_exit_pressed():
	get_tree().change_scene_to_file('res://Scenes/Menu/MainMenu.tscn')
