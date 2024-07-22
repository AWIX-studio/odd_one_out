extends Control

func set_fg_position(x, y):
	$FG.position.x = x
	$FG.position.y = y

func _input(event):
	if event is InputEventMouseMotion:
		var new_fg_pos_x = $FG.position[0] + (-get_viewport().size[0]/2 + -event.position[0])
		var new_fg_pos_y = $FG.position[1] + (-get_viewport().size[1]/2 + -event.position[1])
		set_fg_position(new_fg_pos_x/60 + 20, new_fg_pos_y/60 + 10)

func _on_play_pressed():
	get_tree().change_scene_to_file('res://Scenes/Game/Scene1.tscn')


func _on_quit_pressed():
	get_tree().quit()
