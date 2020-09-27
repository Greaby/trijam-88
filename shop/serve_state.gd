extends State


var client


func enter(msg: Dictionary = {}) -> void:
	client = msg["entity"]
	client.serve = true
	
	Global.money += randi() % 3 + 1
	Global.stock_potatoes -= 1
	
	_state_machine.transition_to("Idle")

