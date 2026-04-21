extends Control

@export var label:Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ControladorGlobal.muertesActualizado.connect(_actualizarContador)

func _actualizarContador():
	label.text = str(ControladorGlobal.muertes)
