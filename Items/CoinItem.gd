extends Node2D

onready var timer = $Timer

func _ready() -> void:
	pass
	

func _process(delta: float) -> void:
	
	
	pass


func _on_Area2D_body_entered(body: Node) -> void:
	queue_free()
	
