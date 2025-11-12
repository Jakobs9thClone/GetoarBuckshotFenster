extends Node3D

var currentResetID = 0

func generateResetID() -> int:
	currentResetID = randi()
	return currentResetID
