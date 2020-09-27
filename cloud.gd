extends Node2D


var start = -264
var end = 36



func _physics_process(delta: float) -> void:
	global_position.x = lerp(start, end, 1 - Global.temperature)
