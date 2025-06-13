extends Label

@export var my_level: int = -1

@onready var label_level: Label = $"."

@onready var label_highlight: Label = $Label_Highlight

func _ready() -> void:
	SignalBus.update_level.connect(_on_update_level)
	
	_on_update_level()

func _on_update_level() -> void:
	if Globals.level == my_level:
		label_highlight.visible = true
	else:
		label_highlight.visible = false
