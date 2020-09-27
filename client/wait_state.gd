extends State


var delay = 8
var time = 0


func enter(_msg: Dictionary = {}) -> void:
	delay = rand_range(7, 12)
	owner.wait = true

func exit() -> void:
	owner.wait = false
	owner.serve = false

func physics_process(delta: float) -> void:
	time += delta

	if owner.serve or time >= delay:
		_state_machine.transition_to("Move", {"target": Global.client_spawner.global_position, "next_state": "Quit"})
