extends Area2D

func _ready() -> void:
	SignalBus.show_flag.connect(_on_show_flag)
	body_entered.connect(_on_body_entered)
	
func _on_show_flag() -> void:
	visible = true
	
func _on_body_entered(body) -> void:
	if body is Player:
		SignalBus.restart.emit()
