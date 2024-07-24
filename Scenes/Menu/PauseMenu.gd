extends Control

func _ready():
	hide()

func _process(_delta):
	if Input.is_action_just_pressed('pause'):
		if self.visible:
			hide()
		else:
			show()

func _on_resume_pressed():
	hide()


func _on_exit_pressed():
	get_tree().change_scene_to_file('res://Scenes/Menu/MainMenu.tscn')
