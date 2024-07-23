extends Control

func set_fg_position(x, y):
	$FG.position.x = x
	$FG.position.y = y
func set_fg2_position(x, y):
	$FG2.position.x = x
	$FG2.position.y = y
func set_buttons_menu_position(x, y):
	$Buttons.position.x = x
	$Buttons.position.y = y

func _input(event):
	if event is InputEventMouseMotion:
		var new_fg_pos_x = $FG.position[0] + (-get_viewport().size[0]/2 + -event.position[0])
		var new_fg_pos_y = $FG.position[1] + (-get_viewport().size[1]/2 + -event.position[1])
		set_fg_position(new_fg_pos_x/80 + 20, new_fg_pos_y/80)
		set_fg2_position(new_fg_pos_x/140 + 20, new_fg_pos_y/140)
		
		var new_buttons_pos_x = $Buttons.position[0] + (-get_viewport().size[0]/2 + -event.position[0])
		var new_buttons_pos_y = $Buttons.position[1] + (-get_viewport().size[1]/2 + -event.position[1])
		set_buttons_menu_position(new_buttons_pos_x/40 + 50, new_buttons_pos_y/40 + 260)


func _on_play_pressed():
	get_tree().change_scene_to_file('res://Scenes/Game/Scene1.tscn')


func _on_quit_pressed():
	get_tree().quit()


func _on_options_pressed():
	$"Buttons/Main menu".visible = false
	$Buttons/Options.visible = true


func _on_back_pressed():
	$"Buttons/Main menu".visible = true
	$Buttons/Options.visible = false


func _on_check_box_toggled(toggled_on):
	if toggled_on:
		ProjectSettings.set_setting("rendering/anti_aliasing/quality/msaa_2d", 1)
	else:
		ProjectSettings.set_setting("rendering/anti_aliasing/quality/msaa_2d", 0)
