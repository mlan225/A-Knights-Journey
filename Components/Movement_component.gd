class_name MovementComponent
extends Node

@export_group("Settings")
@export var speed: float = 100
@export var can_move: bool = true

func handle_horizontal_movement(body: CharacterBody2D, direction: float) -> void:
	if can_move:
		body.velocity.x = direction * speed

func set_can_move(can_move_flag: bool) -> void:
	can_move = can_move_flag
