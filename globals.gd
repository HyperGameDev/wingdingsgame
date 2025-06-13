extends Node

var level: int = 1

func _ready() -> void:
	SignalBus.update_level.connect(_on_update_level)
	
	SignalBus.restart.connect(_on_restart)
	
func _on_update_level() -> void:
	level += 1
	
func _on_restart() -> void: 
	#get_tree().change_scene_to_file("res://main_scene.gd")
	get_tree().reload_current_scene()
