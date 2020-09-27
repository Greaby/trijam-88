extends State


var time = 0

var delay = 0.5


func enter(_msg: Dictionary = {}) -> void:
	time = 0

func physics_process(delta: float) -> void:
	time += delta
	
	if time >= delay:
		time = 0
		
		if Global.stock_potatoes > 0:
			for client in Global.clients.get_children():
				if client.wait:
					_state_machine.transition_to("Move", {"target": owner.start_position, "entity": client, "next_state": "Serve"})
					return

		for potato in Global.garden.get_children():
			if potato.ready:
				_state_machine.transition_to("Move", {"target": potato.global_position, "entity": potato, "next_state": "Harvest"})
