extends State


func enter(_msg: Dictionary = {}) -> void:
	owner.sprite.play("dead")

func physics_process(_delta: float) -> void:
	if Global.temperature > owner.temperature_threesold:
		_state_machine.transition_to("Seed")
