extends Node2D

var start = 808.0
var end = 519.0

func _physics_process(delta: float) -> void:
	global_position.x = lerp(start, end, 1 - Global.temperature)
