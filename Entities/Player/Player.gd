extends CharacterBody2D

@export_subgroup("Nodes")
@export var gravity_component: GravityComponent
@export var input_component: InputComponent
@export var movement_component: MovementComponent
@export var hide_component: HideComponent
@export var roll_component: RollComponent
@export var stamina_component: StaminaComponent

func _physics_process(delta: float) -> void:
	gravity_component.handle_gravity(self, delta)
	movement_component.handle_horizontal_movement(self, input_component.input_horizontal)
	
	## only allow hiding if player is near a hiding spot
	if hide_component.can_hide:
		if input_component.get_hide_input() and not hide_component.is_hidden:
			hide_component.handle_hide(self, true)
			movement_component.set_can_move(false)
		elif input_component.get_hide_input() and hide_component.is_hidden:
			hide_component.handle_unhide(self, true)
			movement_component.set_can_move(true)
			
	## allow rolling when player has stamina
	if input_component.get_roll_input():
		if(stamina_component.stamina_bar.value > 0):
			stamina_component.UseStamina(20)
			roll_component.handle_roll()
	
	move_and_slide()
