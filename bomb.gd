extends StaticBody2D

@onready var area: Area2D = $Area

var player_seen: bool = false


func _ready() -> void:
	area.body_entered.connect(_on_body_entered)
	area.body_exited.connect(_on_body_exited)
	
func _on_body_entered(body) -> void:
	if not player_seen: 
		if body is Player:
			player_seen = true
			SignalBus.enemy_touched.emit()

func _on_body_exited(body) -> void:
	if body is Player:
		player_seen = false
