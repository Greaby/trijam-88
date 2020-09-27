extends Node2D


func _ready() -> void:
	$score.text = "Score : " + str(Global.money)
