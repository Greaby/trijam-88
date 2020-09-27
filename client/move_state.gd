extends State


var time = 0
var delay = 2.0


var start_position = Vector2()
var target = Vector2()

var next_state = "Idle"


func enter(msg: Dictionary = {}) -> void:
	start_position = owner.global_position
	
	target = msg["target"] 
	next_state = msg["next_state"]
	
	time = 0

func physics_process(delta: float) -> void:
	time = clamp(time + delta, 0.0, delay)
	
	owner.global_position = start_position.linear_interpolate(target, time / delay)
	
	if time >= delay:
		_state_machine.transition_to(next_state)


