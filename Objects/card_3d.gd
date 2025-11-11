extends Node3D

@export var isActive = false
@export var isCorner = true
@export var topCard: Node
@export var bottomCard: Node
@export var leftCard: Node
@export var rightCard: Node

var cardValue = 0; #max 12
var cardSymbol = 0; #max 3

var hasBeenTurned = false;
var hasTurnedNeighbours = false

var mouseIsOn = false;

var otherVar

@onready var animation_player = $AnimationPlayer

func _ready() -> void:
	if isCorner:
		hasBeenTurned =  true
		animation_player.play("flip")

func _process(delta: float) -> void:
	if mouseIsOn == true:
		pass
	
	hasTurnedNeighbours = false
	if topCard != null:
		if topCard.hasBeenTurned == true:
			hasTurnedNeighbours = true
	if bottomCard != null:
		if bottomCard.hasBeenTurned == true:
			hasTurnedNeighbours = true
	if leftCard != null:
		if leftCard.hasBeenTurned == true:
			hasTurnedNeighbours = true
	if rightCard != null:
		if rightCard.hasBeenTurned == true:
			hasTurnedNeighbours = true

func _input(event):
	# Mouse in viewport coordinates.
	if event is InputEventMouseButton:
		if mouseIsOn and not hasBeenTurned:
			hasBeenTurned = true
			animation_player.play("flip")
	elif event is InputEventMouseMotion:
		pass


func _on_area_3d_mouse_entered() -> void:
	if not hasBeenTurned and hasTurnedNeighbours:
		animation_player.play("hover")
		mouseIsOn = true;

func _on_area_3d_mouse_exited() -> void:
	if not hasBeenTurned and hasTurnedNeighbours:
		animation_player.play("hover_down")
		mouseIsOn = false 
