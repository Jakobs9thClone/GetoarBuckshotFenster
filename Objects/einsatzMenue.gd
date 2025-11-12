extends Control
signal item_chosen(id: String)

@onready var items_row: HBoxContainer = %Einsätze

func _ready() -> void:
	print("EinsatzMenu READY")
	
