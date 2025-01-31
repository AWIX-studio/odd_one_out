extends Node

var current_start = 'START1'

func _ready() -> void:
	if DataManager.load('Start') != null:
		current_start = DataManager.load('Start')
