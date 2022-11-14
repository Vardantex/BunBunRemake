extends CanvasLayer

export (PackedScene) var nextLevel 

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass



func _on_MainButton_pressed() -> void:
	get_tree().change_scene("res://Scenes/MainMenu.tscn")


func _on_NextButton_pressed() -> void:
	get_tree().change_scene_to(nextLevel)
