class_name PlayerAttackComponent

extends Node2D

@export_group("Components")
@export var stamina_component : StaminaComponent
@export var player_hurtbox_component : PlayerHurtboxComponent

@export_group("Settings")
@export var attack_length : float
@export var attack_stamina_cost : int

var can_attack : bool
var is_attacking : bool

func _ready() -> void:
	is_attacking = false
	can_attack = true
	player_hurtbox_component.visible = false

func Handle_attack() -> void:
	if can_attack and not is_attacking:
		stamina_component.UseStamina(attack_stamina_cost)
		is_attacking = true
		
		await get_tree().create_timer(attack_length / 2).timeout
		player_hurtbox_component.visible = true
		
		await get_tree().create_timer(attack_length / 2).timeout
		is_attacking = false
		player_hurtbox_component.visible = false
