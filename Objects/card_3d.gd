extends Node3D

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

@onready var animation_player = $AnimationPlayer

func _ready() -> void:
	pass
	#var otherVar = $card
	#Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if mouseIsOn == true:
		print("otherCard active")
	#print(otherVar.isActive)
	#var otherScript = otherCard.get_script()
	#if otherScript.isActive == true:
	#	print("collision with other object")

func _input(event):
	# Mouse in viewport coordinates.
	if event is InputEventMouseButton:
		if mouseIsOn:
			animation_player.play("flip")
		print("Mouse Click/Unclick at: ", event.position)
	elif event is InputEventMouseMotion:
		#print("Mouse Motion at: ", event.position)
		pass

	# Print the size of the viewport.
	#print("Viewport Resolution is: ", get_viewport().get_visible_rect().size)

func _on_area_3d_mouse_entered() -> void:
	animation_player.play("hover")
	mouseIsOn = true; # Replace with function body.


func _on_area_3d_mouse_exited() -> void:
	animation_player.play("hover_down")
	mouseIsOn = false # Replace with function body.
