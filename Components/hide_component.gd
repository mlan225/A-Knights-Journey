class_name HideComponent
extends Node

@export var is_hidden: bool = false
@export var can_hide: bool = false

func handle_hide(body: CharacterBody2D, want_to_hide: bool) -> void:
	if can_hide:
		if want_to_hide and not is_hidden:
			body.hide()
			is_hidden = true
	
func handle_unhide(body: CharacterBody2D, want_to_unhide: bool) -> void:
	if want_to_unhide and is_hidden:
		body.show()
		is_hidden = false

func set_can_hide(can_hide_flag: bool):
	can_hide = can_hide_flag
