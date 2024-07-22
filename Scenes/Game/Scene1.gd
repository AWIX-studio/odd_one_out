extends Control


func _on_button_pressed():
	remove_child($Button)
	$DialogueBox.start("START")
