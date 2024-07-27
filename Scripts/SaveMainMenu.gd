class_name SaveLoad
extends Node

@onready var full_screen = $"../../Buttons/Options/VBoxContainer/FullScreen"
@onready var option_button = %OptionButton

var SAVE_GAME_PATH : String = 'user://savegame.tres'

func _ready():
	FileAccess.open(SAVE_GAME_PATH, FileAccess.READ)
	
func save_game():
	var saved_game : SavedGame = SavedGame.new()
	
	saved_game.full_screen_button_pressed = full_screen.button_pressed
	saved_game.option_button_selected = option_button.selected
	
	ResourceSaver.save(saved_game, 'user://savegame.tres')
	

func load_game():
	var saved_game : SavedGame = load('user://savegame.tres') as SavedGame
	
	full_screen.button_pressed = saved_game.full_screen_button_pressed
	option_button.selected = saved_game.option_button_selected
