class_name InputComponent
extends Node

var input_horizontal: float = 0.0
## default last direction to the right for now
var last_direction: float = 1.0
var can_input: bool = true

func _process(_delta: float) -> void:
	## Get -1 for left and 1 for right
	if can_input:
		input_horizontal = Input.get_axis("move_left", "move_right")
		if input_horizontal == 1.0 or input_horizontal == -1.0:
			last_direction = input_horizontal
	
func get_hide_input() -> bool:
	return Input.is_action_just_pressed("hide") and can_input
	
func get_roll_input() -> bool:
	return Input.is_action_just_pressed("roll") and can_input
