extends Node

var timer_running: bool = true
var time: float = 0.0

const START_POS: Vector2 = Vector2(0.0,384.0)

var level: int = 1
var current_bells: int = 0

var current_folder: Area2D = null

var no_more_bells: bool = false

const levels: Array = [
	"",
	"res://level_1.tscn",
	"res://level_2.tscn",
	"res://level_3.tscn",
	"res://level_4.tscn",
	"res://level_5.tscn",
	"res://level_final.tscn"
	
]

func _process(delta: float) -> void:
	if timer_running:
		time += delta
	if level > 0 and current_bells == 0 and not no_more_bells:
		no_more_bells = true
		if not current_folder == null:
			current_folder.label_folder.text = "1"
			current_folder.is_open = true

func _ready() -> void:
	SignalBus.update_level.connect(_on_update_level)
	
	SignalBus.restart.connect(_on_restart)
	
func _on_update_level() -> void:
	level += 1
	if Globals.level == 6:
		print("MMMM")
		timer_running = false
		if time < 45.:
			SignalBus.stars.emit(3)
		elif time < 90.:
			SignalBus.stars.emit(2)
		else:
			SignalBus.stars.emit(1)
	
	no_more_bells = false
	
	
func _on_restart() -> void: 
	#get_tree().change_scene_to_file("res://main_scene.gd")
	
	level = 1
	current_bells = 0
	no_more_bells = false
	time = 0.0
	timer_running = true
	
	get_tree().reload_current_scene()
