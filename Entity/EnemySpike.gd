extends Node2D

export var is_walking = false

func _process(delta: float) -> void:
	if (is_walking):
		$EnemyAnimation.play("WALK")
	else:
		$EnemyAnimation.play("STAND")

func _ready() -> void:
	pass
