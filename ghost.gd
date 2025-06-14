extends Area2D

@onready var label_ghost: Label = $Label_Ghost

@onready var timer: Timer = $Timer

@onready var collision: CollisionShape2D = $Collision

var is_ghost: bool = true

var ghost_length: float = 0.


var player_seen: bool = false


func _ready() -> void:
	timer.timeout.connect(_on_timer_timeout)
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	
	randomize_time()
	
	#await get_tree().create_timer(ghost_length)
	timer.start(ghost_length)

func randomize_time() -> void:
	ghost_length = randf_range(1.,2.)
	
func _on_body_entered(body) -> void:
	if not player_seen: 
		if body is Player:
			if label_ghost.modulate.a == 1:
				player_seen = true
				SignalBus.enemy_touched.emit()

func _on_body_exited(body) -> void:
	if body is Player:
		player_seen = false

func _on_timer_timeout() -> void:
	if not is_ghost:
		is_ghost = true
		var tween: Tween = create_tween()
		tween.tween_property(label_ghost,"modulate:a",0.,.3)
		collision.disabled = true
		
	else:
		is_ghost = false
		var tween: Tween = create_tween()
		tween.tween_property(label_ghost,"modulate:a",1.,.3)
		collision.disabled = false
		
