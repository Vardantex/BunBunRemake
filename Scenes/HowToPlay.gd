extends Control


func _ready() -> void:
	pass


func _on_ReturnButton_pressed() -> void:
	get_tree().change_scene("res://Scenes/MainMenu.tscn")

