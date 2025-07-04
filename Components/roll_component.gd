class_name RollComponent
extends Node

@export_group("Nodes")
@export var movement_component: MovementComponent
@export var input_component: InputComponent

@export_group("Settings")
@export var roll_speed: float = 600

## Increase speed on move_component, use last direction for roll direction
## and disable inputs on input component for a brief duration during roll
func handle_roll() -> void:
	movement_component.speed += roll_speed
	input_component.input_horizontal = input_component.last_direction
	input_component.can_input = false
	await get_tree().create_timer(.3).timeout
	movement_component.speed -= roll_speed
	input_component.can_input = true
