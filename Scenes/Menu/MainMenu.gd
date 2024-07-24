extends Control

# Options variables


@onready var resolution_option_button = $Buttons/Options/VBoxContainer/OptionButton
var resolutions: Dictionary = {
	'1920x1080':Vector2(1920, 1080),
	'1600x900':Vector2(1600, 900),
	'1440x900':Vector2(1440, 900),
	'1366x768':Vector2(1366, 768),
	'1280x720':Vector2(1280, 720),
	'1152x648':Vector2(1152, 648),
	'1024x600':Vector2(1024, 600),
	'800x600':Vector2(800, 600)
}

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
		var new_fg_pos_x = $FG.position[0] + (-get_viewport().size[0] + -event.position[0])
		var new_fg_pos_y = $FG.position[1] + (-get_viewport().size[1] + -event.position[1])
		set_fg_position(new_fg_pos_x/80 + 20, new_fg_pos_y/80)
		set_fg2_position(new_fg_pos_x/140 + 20, new_fg_pos_y/140)
		
		var new_buttons_pos_x = $Buttons.position[0] + (-get_viewport().size[0] + -event.position[0])
		var new_buttons_pos_y = $Buttons.position[1] + (-get_viewport().size[1] + -event.position[1])
		set_buttons_menu_position(new_buttons_pos_x/40 + 100, new_buttons_pos_y/40 + 260)


func _on_play_pressed():
	$Buttons/MainMenu.visible = false
	$SetName.visible = true


func _on_quit_pressed():
	get_tree().quit()


func _on_options_pressed():
	$Buttons/MainMenu.visible = false
	$Buttons/Options.visible = true


func _on_back_pressed():
	$Buttons/MainMenu.visible = true
	$Buttons/Options.visible = false

func _on_new_game_pressed():
	if $SetName/TextEdit.text != "":
		set_player_name($SetName/TextEdit.text)
		get_tree().change_scene_to_file('res://Scenes/Game/Scene1.tscn')
	else: pass


func set_player_name(player_name:String):
	var Characters = preload("res://Dialogues/Characters/Characters.tres")
	Characters.characters[0].name = player_name
	ResourceSaver.save(Characters)
	var PlayerName = preload("res://Dialogues/chapter 0.tres")
	PlayerName.variables['name']['value'] = Characters.characters[0].name
	ResourceSaver.save(PlayerName)
	


func _on_github_pressed():
	OS.shell_open('https://github.com/AWIX-studio/odd_one_out')


func _on_discord_pressed():
	OS.shell_open('https://discord.gg/j9SpvCuj58')


func _on_full_screen_toggled(toggled_on):
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func add_resolution_options():
	var current_resolution = get_viewport()
