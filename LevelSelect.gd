extends Control




func _ready() -> void:
#	HBoxContainer.add_constant_override("separation", 4)
	pass


func _on_ReturnButton_pressed() -> void:
	get_tree().change_scene("res://Scenes/MainMenu.tscn")
