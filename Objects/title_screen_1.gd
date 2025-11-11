extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CenterContainer/VBoxContainer/startGame.pressed.connect(startsaftung)
	$CenterContainer/VBoxContainer/endGame.pressed.connect(endsaftung)

func startsaftung():
	get_tree().change_scene_to_packed(load("res://Levels/main3d.tscn"))

func endsaftung():
	get_tree().quit()
