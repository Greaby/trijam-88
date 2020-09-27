extends ColorRect

var start = 0
var end = 0.4

func _physics_process(delta: float) -> void:
	color.a = lerp(start, end, 1 - Global.temperature)
