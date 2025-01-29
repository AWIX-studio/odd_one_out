extends Node

var file = preload("res://Game_data/routes.tres")

func add_relation(character : String, value : int):
	if character in file.get_meta_list():
		file.set_meta(character, file.get_meta(character) + value)
		ResourceSaver.save(file)
	else:
		print('ОШИБКА. add_relation() первый аргумент не существует в списке имён персонажей.')

func get_relation(character : String):
	if character in file.get_meta_list():
		return file.get_meta(character)
	else:
		print('ОШИБКА. get_relation() первый аргумент не существует в списке имён персонажей.')

func set_relation(character : String, value : int):
	if character in file.get_meta_list():
		file.set_meta(character, value)
	else:
		print('ОШИБКА. set_relation() первый аргумент не существует в списке имён персонажей.')
