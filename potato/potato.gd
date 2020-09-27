extends Node2D

var temperature_threesold = 0.3

var ready = false
var harvested = false


onready var sprite = $AnimatedSprite


func _ready() -> void:
	sprite.play("seed")
