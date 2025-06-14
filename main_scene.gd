extends Node2D
@onready var post_color: TextureRect = $Post_color

@onready var star_1: Label = $Stars/MarginContainer/Hbox/Star_1
@onready var star_2: Label = $Stars/MarginContainer/Hbox/Star_2
@onready var star_3: Label = $Stars/MarginContainer/Hbox/Star_3

func _ready() -> void:
	var color_mat: ShaderMaterial = post_color.get_material()
	color_mat.set_shader_parameter("mode",randi_range(0,3))
	SignalBus.stars.connect(_on_stars)
	
func _on_stars(star_number) -> void:
	match star_number:
		3:
			await get_tree().create_timer(.4)
			star_1.visible = true
			await get_tree().create_timer(.4)
			star_2.visible = true
			await get_tree().create_timer(.4)
			star_3.visible = true
			await get_tree().create_timer(.4)
			SignalBus.show_flag.emit()
		2:
			await get_tree().create_timer(.4)
			star_1.visible = true
			await get_tree().create_timer(.4)
			star_2.visible = true
			await get_tree().create_timer(.4)
			SignalBus.show_flag.emit()
		1:
			await get_tree().create_timer(.4)
			star_2.visible = true
			await get_tree().create_timer(.4)
			SignalBus.show_flag.emit()
		_:
			pass
			await get_tree().create_timer(.4)
			SignalBus.show_flag.emit()
			
