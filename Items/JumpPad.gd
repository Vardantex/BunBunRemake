extends Node2D

onready var timer = $PadTimer

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if (timer.is_stopped()):
		$PadSprite.play("idle")




func _on_PadArea_body_entered(body: Node) -> void:
	$PadSprite.play("boost")
	body.boost()
	timer.start()
	
