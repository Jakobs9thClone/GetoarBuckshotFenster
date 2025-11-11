extends Node2D

@export var isActive = false
@export var isCorner = true
@export var topCard: Node
@export var bottomCard: Node
@export var leftCard: Node
@export var rightCard: Node

var cardValue = 0; #max 12
var cardSymbol = 0; #max 3

var mouseIsOn = false;

var otherVar


func _ready() -> void:
	pass
	#var otherVar = $card
	#Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if topCard.mouseIsOn == true:
		print("otherCard active")
	#print(otherVar.isActive)
	#var otherScript = otherCard.get_script()
	#if otherScript.isActive == true:
	#	print("collision with other object")

func _input(event):
	# Mouse in viewport coordinates.
	if event is InputEventMouseButton:
		print("Mouse Click/Unclick at: ", event.position)
	elif event is InputEventMouseMotion:
		#print("Mouse Motion at: ", event.position)
		pass

	# Print the size of the viewport.
	#print("Viewport Resolution is: ", get_viewport().get_visible_rect().size)

func _on_area_2d_area_entered(area: Area2D) -> void:
	print("area entered"); # Replace with function body.

func _on_area_2d_mouse_entered() -> void:
	mouseIsOn = true; # Replace with function body.

func _on_area_2d_mouse_shape_entered(shape_idx: int) -> void:
	pass # Replace with function body.

func _on_area_2d_mouse_exited() -> void:
	mouseIsOn = false # Replace with function body.
