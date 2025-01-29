extends Node

var file = preload("res://Game_data/data.tres")

# [Scene, Nothing for now]
var data = file.get_meta('data')

func save(data_type : String, save_data):
	if data_type in ['Scene', 'Start']:
		if data_type == 'Scene':
			data[0] = save_data
		elif data_type == 'Start':
			data[1] = save_data
		file.set_meta('data', data)
		ResourceSaver.save(file)
	else:
		print('ERROR. Wrong data type in the first argument of data_manager.save()')

func load(data_type : String):
	if data_type in ['Scene', 'Start']:
		if data_type == 'Scene':
			return file.get_meta('data')[0]
		if data_type == 'Start':
			return file.get_meta('data')[1]
	else:
		print('ERROR. Wrong data type in argument of data_manager.load()')
