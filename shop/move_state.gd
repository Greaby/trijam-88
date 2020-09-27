extends State


var time = 0.0
var delay = 2.0

var speed = 150

var start_position = Vector2()
var target = Vector2()

var next_state = "Idle"
var entity


func enter(msg: Dictionary = {}) -> void:
	time = 0.0
	start_position = owner.global_position
	
	target = msg["target"] 
	next_state = msg["next_state"]
	entity = msg["entity"]


func physics_process(delta: float) -> void:
	time = clamp(time + delta, 0.0, delay)
	
	var direction = owner.global_position.direction_to(target)
	
	var move = direction * speed * delta
	
	if owner.global_position.distance_to(target) < move.length():
		owner.global_position = target
	else:
		owner.global_position += move
	
	if owner.global_position.distance_to(target) < 5:
		_state_machine.transition_to(next_state, {"entity": entity})
