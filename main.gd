extends Node2D

var min_wait_time = 1
var max_wait_time = 10

var min_wait_time_random = 0.5
var max_wait_time_random = 4


var time = 0

onready var slider = $VSlider
onready var client_timer = $ClientTimer

func _ready() -> void:
	randomize()
	Global.garden = $garden
	Global.clients = $clients
	Global.client_spawner = $client_spawner
	Global.shop_position = $shop.global_position
	
	display_time_label()


func _physics_process(delta: float) -> void:
	Global.temperature = lerp(Global.temperature, slider.value, delta / 7)
	
	var random = lerp(min_wait_time_random, max_wait_time_random, Global.temperature)
	client_timer.wait_time = lerp(min_wait_time, max_wait_time, Global.temperature) + randf() * random
	
	$sun.scale.x = lerp(1, 5, Global.temperature)
	$sun.scale.y = lerp(1, 5, Global.temperature)


func _on_Timer_timeout() -> void:
	time += 1
	display_time_label()
	if time >= Global.TIME:
		get_tree().change_scene("res://game_over.tscn")

func display_time_label() -> void:
	var left = Global.TIME - time
	
	var minute = floor(left / 60)
	var second = left % 60

	$TimeLabel.text =  str(minute) + ":" + str("%02d" % second)
	

func _on_ClientTimer_timeout() -> void:
	var client_instance = load("res://client/client.tscn").instance()
	client_instance.global_position = Global.client_spawner.global_position
	
	Global.clients.add_child(client_instance)
	
