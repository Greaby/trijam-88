extends State

func enter(_msg: Dictionary = {}) -> void:
	owner.queue_free()
