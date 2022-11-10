extends Camera2D

export (Color, RGB) var color

func _ready() -> void:
	#Use Visual Server to apply to anything visible
	VisualServer.set_default_clear_color(color)
