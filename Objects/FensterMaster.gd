extends Node3D

var currentPlayer = 0 #0 = Getti, 1 = Blasrohr
var mouseGameplayBlock = false #kann auf true gestellt werden, wenn das Einsätze Menü gerade angezeigt wird
var allowedToSwitchPlayer = false

var stateOfCurrentCard = 0 #0 = kann nicht ausgewählt werden, 1 = Karte hat einen Nachbar, 2 = Karte hat mind. 2 Nachbarn

var Getti_Money = 100
var Bleron_Money = 100

func _process(delta: float) -> void:
	print(stateOfCurrentCard)
