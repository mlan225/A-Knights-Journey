class_name StaminaComponent
extends Node2D

## I think I can replace this export with a $ selection
@export var stamina_bar : ProgressBar
@export var cooldown_timer : Timer

var can_regen : bool
var regen_active: bool

func _ready() -> void:
	can_regen = false
	regen_active = false
	stamina_bar.value = 100

func _process(delta):
	if(stamina_bar.value < 100):
		ToggleStaminaBarDisplay(true)
	else:
		ToggleStaminaBarDisplay(false)
	
	if can_regen:
		if stamina_bar.value < 100:
			RegenStamina()
		else:
			can_regen = false
			regen_active = false
	else:
		if stamina_bar.value < 100 and regen_active == false:
			StartCooldown()

func RegenStamina() -> void:
	stamina_bar.value += 0.2

func UseStamina(staminaUsed: int) -> void:
	stamina_bar.value -= staminaUsed
	can_regen = false
	StartCooldown()
	
func StartCooldown() -> void:
	regen_active = true
	cooldown_timer.start(2)

func ToggleStaminaBarDisplay(showBar: bool) -> void:
	visible = showBar

func _on_cooldown_timer_timeout() -> void:
	can_regen = true
