extends CharacterBody2D
class_name Player

@onready var label_health: Label = $Label_Health

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var health: int = 3

func _ready() -> void:
	SignalBus.enemy_touched.connect(_on_enemy_touched)
	
func _on_enemy_touched() -> void: #M
	health -= 1

func _physics_process(delta: float) -> void:
	if health > 0:
		move_and_slide()
	match health:
		3:
			label_health.text = "J"
		2:
			label_health.text = "K"
		1:
			label_health.text = "L"
		0:
			label_health.text = "N"
			var tween: Tween = create_tween()
			tween.tween_property(label_health,"scale",Vector2(5.,5.),2.)
			await get_tree().create_timer(2.).timeout
			SignalBus.restart.emit()
			
		_:
			pass
	
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
