class_name SaveLoad
extends Node

@onready var full_screen = %FullScreen
@onready var option_button = %OptionButton

var full_screen_toggle_mode
var option_button_selected

var SAVE_GAME_PATH : String = 'user://savegame.json'
var options_dict : Dictionary

func _ready():
	full_screen_toggle_mode = full_screen.toggle_mode
	option_button_selected = option_button.selected

func save_game():
	options_dict['full_screen_button_pressed'] = full_screen_toggle_mode
	options_dict['option_button_selectd'] = option_button_selected
	
	var file = FileAccess.open(SAVE_GAME_PATH, FileAccess.WRITE)

	var json = JSON.stringify(options_dict)
	
	file.store_string(json)
	file.close()

func load_game():
	var file = FileAccess.open(SAVE_GAME_PATH, FileAccess.READ)
	var json = file.get_as_text()
	var options_dict_json = JSON.parse_string(json)
	
	full_screen.toggle_mode = options_dict_json['full_screen_button_pressed']
	option_button.selected = options_dict_json['option_button_selectd']
