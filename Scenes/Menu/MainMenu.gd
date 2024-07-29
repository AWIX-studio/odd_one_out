extends Control

# Options variables
@onready var resolution_option_button = $Buttons/Options/VBoxContainer/OptionButton
@onready var fullscreen_checkbox = $Buttons/Options/VBoxContainer/FullScreen
@onready var resolutions: Dictionary = {
	'1920x1080':Vector2(1920, 1080),
	'1600x900':Vector2(1600, 900),
	'1440x900':Vector2(1440, 900),
	'1366x768':Vector2(1366, 768),
	'1280x720':Vector2(1280, 720),
	'1152x648':Vector2(1152, 648),
	'1024x600':Vector2(1024, 600),
	'800x600':Vector2(800, 600)
}

#from SaveMainMenu.gd
@onready var full_screen = %FullScreen
@onready var option_button = %OptionButton


var SAVE_GAME_PATH : String = 'user://savegame.json'
var options_dict : Dictionary


func _ready():
	add_resolution_options()
	load_game()


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

func _on_new_game_pressed():
	if $SetName/TextEdit.text != "":
		save_game()
		set_player_name($SetName/TextEdit.text)
		get_tree().change_scene_to_file('res://Scenes/Game/Scene1.tscn')
	else: pass


func _on_quit_pressed():
	save_game()
	get_tree().quit()


func _on_options_pressed():
	$Buttons/MainMenu.visible = false
	$Buttons/Options.visible = true


func _on_back_pressed():
	$Buttons/MainMenu.visible = true
	$Buttons/Options.visible = false
	save_game()


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


func add_resolution_options():
	var _current_resolution = get_viewport()
	var resolution_option_button_id = 0
	for i in resolutions:
		resolution_option_button.add_item(i, resolution_option_button_id)
		resolution_option_button_id += 1
	resolution_option_button.selected = 5


func _on_full_screen_toggled(toggled_on):
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		resolution_option_button.disabled = true
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		resolution_option_button.disabled = false
		_on_option_button_item_selected(option_button.selected)


func _on_option_button_item_selected(index):
	DisplayServer.window_set_size(resolutions.get(resolution_option_button.get_item_text(index)))


#from SaveMainMenu.gd
func save_game():
	options_dict['full_screen_button_pressed'] = full_screen.button_pressed
	options_dict['option_button_selected'] = option_button.selected
	
	var file = FileAccess.open(SAVE_GAME_PATH, FileAccess.WRITE)

	var json = JSON.stringify(options_dict)
	
	file.store_string(json)
	file.close()

func load_game():
	if FileAccess.file_exists(SAVE_GAME_PATH):
		var file = FileAccess.open(SAVE_GAME_PATH, FileAccess.READ)
		var json = file.get_as_text()
		var options_dict = JSON.parse_string(json)
		
		full_screen.button_pressed = options_dict['full_screen_button_pressed']
		option_button.selected = options_dict['option_button_selected']
		
		apply_options(options_dict)


func _on_load_pressed():
	pass


func apply_options(dict : Dictionary):
	_on_full_screen_toggled(dict['full_screen_button_pressed'])
	_on_option_button_item_selected(dict['option_button_selected'])
