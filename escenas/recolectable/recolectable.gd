extends Node2D

@export var area2d: Area2D
var contenedorRecolectables: ContenedorRecolectables

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area2d.body_entered.connect(_recogida)

func _recogida(_body):
	contenedorRecolectables.recolectableAgarrado()
	queue_free()
