extends State


func physics_process(_delta: float) -> void:
	
	var position = Vector2()
	position.y = rand_range(-10, 10)
	position.x = rand_range(-10, 10)
	
	_state_machine.transition_to("Move", {"target": Global.shop_position + position, "next_state": "Wait"})
