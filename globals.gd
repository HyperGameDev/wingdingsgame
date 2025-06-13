extends Node

var level: int = 0

func _ready() -> void:
	SignalBus.update_level.connect(_on_update_level)
	
func _on_update_level() -> void:
	level += 1
