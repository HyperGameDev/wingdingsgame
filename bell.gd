extends Area2D

@onready var label_bell: Label = $Label_Bell

@onready var label_highlight: Label = $Label_Highlight

var player_seen: bool = false


func _ready() -> void:
	Globals.current_bells += 1
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	
func _on_body_entered(body) -> void:
	if not player_seen: 
		if body is Player:
			player_seen = true
			label_highlight.visible = true
			
			label_bell.modulate = Color(Color(0.62, 0.498, 0.161))
			Globals.current_bells -= 1
			

func _on_body_exited(body) -> void:
	if body is Player:
		player_seen = false
