extends Node3D

@export var debug_Label: Node
@export var isActive = false
@export var isCorner = true
@export var topCard: Node
@export var bottomCard: Node
@export var leftCard: Node
@export var rightCard: Node

var cardValue = 0; #max 12
var cardSymbol = 0; #max 3

var hasBeenTurned = false
var hasTurnedNeighbours = false

var mouseIsOn = false

var otherVar

@onready var animation_player = $AnimationPlayer

func _ready() -> void:
	cardValue = randi_range(0,12)
	debug_Label.text = str(cardValue)
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

func getAmountOfTurnedNeighbours() -> Vector3i:
	var temp = Vector3i(0,0,0)
	var max = 0
	var min = 999
	if topCard != null:
		if topCard.hasBeenTurned == true:
			temp.x += 1
			if topCard.cardValue > max:
				max = topCard.cardValue
			if topCard.cardValue < min:
				min = topCard.cardValue
	
	if bottomCard != null:
		if bottomCard.hasBeenTurned == true:
			temp.x += 1
			if bottomCard.cardValue > max:
				max = bottomCard.cardValue
			if bottomCard.cardValue < min:
				min = bottomCard.cardValue
	
	if leftCard != null:
		if leftCard.hasBeenTurned == true:
			temp.x += 1
			if leftCard.cardValue > max:
				min = leftCard.cardValue
			if leftCard.cardValue < min:
				min = leftCard.cardValue
	
	if rightCard != null:
		if rightCard.hasBeenTurned == true:
			temp.x += 1
			if rightCard.cardValue > max:
				max = rightCard.cardValue
			if rightCard.cardValue < min:
				max = rightCard.cardValue
	temp.y = min
	temp.z = max
	return temp

func reset() -> void:
	pass

func _input(event):
	if event is InputEventMouseButton:

		if mouseIsOn and not hasBeenTurned:
			hasBeenTurned = true
			animation_player.play("flip")
			var numN = getAmountOfTurnedNeighbours()
			if event.is_action_pressed("Mouse Left"):
				print(numN)
				if numN.x == 1:
					if cardValue >= numN.z:
						reset()
						print("verloren du Pisser")
				if numN.x >= 2:
					if cardValue <= numN.z and cardValue >= numN.y:
						print("innerhalb du kleiner Peach")
						
			if event.is_action_pressed("Mouse Right"):
				if numN.x == 1:
					if cardValue <= numN.z:
						reset()
						print("verloren weil kleiner")
					if numN.x >= 2:
						if cardValue >= numN.z and cardValue <= numN.y:
							print("außerhalb du Pisser")
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
