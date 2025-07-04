extends Camera2D

@export var target: Node2D

func _process(delta: float) -> void:
	if target:
		set_position(target.get_position())
