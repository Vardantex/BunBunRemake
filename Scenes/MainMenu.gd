extends Control


func _ready() -> void:
	pass


func _on_Button_pressed() -> void:
	get_tree().change_scene("res://Scenes/LevelSelect.tscn")


func _on_InstructionButton_pressed() -> void:
	get_tree().change_scene("res://Scenes/HowToPlay.tscn")

func _on_ControlsButton_pressed() -> void:
	get_tree().change_scene("res://Scenes/Controls.tscn")

func _on_QuitButton_pressed() -> void:
	get_tree().quit()







