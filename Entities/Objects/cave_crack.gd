extends Node

@export var player = CharacterBody2D


## When the player enters object area set can_hide in player hide component
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.hide_component.set_can_hide(true)

## When the player leaves the object area set can_hide in player hide component
func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.hide_component.set_can_hide(false)
