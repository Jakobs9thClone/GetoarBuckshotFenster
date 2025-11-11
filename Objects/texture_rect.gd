extends TextureRect

@export var parallax_strength: float = 0.05

func _process(delta):
	var mouse_pos = get_viewport().get_mouse_position()
	var win_size = get_viewport_rect().size
	var offset = -(mouse_pos - win_size * 0.5) * parallax_strength
	position = offset
