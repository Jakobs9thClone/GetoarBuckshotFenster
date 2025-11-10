extends Node2D

@export var isActive = false
@export var isCorner = true

var cardValue = 0; #max 12
var cardSymbol = 0; #max 3

func _ready() -> void:
	pass # Replace with function body.

#sdfölkjsadfölkjasöldkföalskjdföoasjfiojawelvysrklgj

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event):
	# Mouse in viewport coordinates.
	if event is InputEventMouseButton:
		print("Mouse Click/Unclick at: ", event.position)
	elif event is InputEventMouseMotion:
		#print("Mouse Motion at: ", event.position)
		pass

	# Print the size of the viewport.
	print("Viewport Resolution is: ", get_viewport().get_visible_rect().size)
