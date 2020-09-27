extends State


func enter(_msg: Dictionary = {}) -> void:
	owner.ready = true
	owner.sprite.play("ready")

func physics_process(delta: float) -> void:
	if owner.harvested:
		_state_machine.transition_to("Seed")
		
	if Global.temperature <= owner.temperature_threesold:
		_state_machine.transition_to("Dead")

func exit() -> void:
	owner.ready = false
	owner.harvested = false
