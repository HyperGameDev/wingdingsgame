extends Node2D

func _ready() -> void:
	SignalBus.update_level.emit()
