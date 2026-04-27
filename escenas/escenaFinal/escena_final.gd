extends Control

@export var label :Label

func _ready() -> void:
	label.text = str(ControladorGlobal.muertes)
	
	ControladorGlobal.muertes = 0
