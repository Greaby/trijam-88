extends State


var delay = 1.5
var time = 0

var potato

func enter(msg: Dictionary = {}) -> void:
	time = 0
	potato = msg["entity"]


func physics_process(delta: float) -> void:
	time += delta
	
	if time >= delay:
		Global.stock_potatoes += randi() % 2 + 1
		potato.harvested = true
		_state_machine.transition_to("Idle")
