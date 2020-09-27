extends State

var min_wait_time = 2
var max_wait_time = 10

var min_wait_time_random = 2
var max_wait_time_random = 5

var delay = 8
var time = 0


func enter(_msg: Dictionary = {}) -> void:
	time = 0
	
	var wait_time = lerp(min_wait_time, max_wait_time, 1 - Global.temperature)
	var random_time = lerp(min_wait_time_random, max_wait_time_random, 1 - Global.temperature)
	delay = rand_range(wait_time, wait_time + random_time)
	
	owner.sprite.play("grow")


func physics_process(delta: float) -> void:
	time += delta
	
	if Global.temperature <= owner.temperature_threesold:
		_state_machine.transition_to("Dead")

	if time >= delay:
		_state_machine.transition_to("Ready")
