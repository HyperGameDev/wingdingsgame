extends Area2D
@onready var label_folder: Label = $Label_Folder

var is_open: bool = false

func _ready() -> void:
	Globals.current_folder	 = self
	body_entered.connect(_on_body_entered)
	
func _on_body_entered(body) -> void:
	if is_open and body is Player:
		SignalBus.update_level.emit()
		var next_level: Node2D = Globals.levels[Globals.level].instantiate()
		Level_Node.ref.add_child(next_level)
		get_owner().queue_free()
		
