extends Node2D

@export var area2d: Area2D
var contenedorRecolectables: ContenedorRecolectables

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area2d.body_entered.connect(_recogida)
	_animar()


func _recogida(_body):
	contenedorRecolectables.recolectableAgarrado()
	queue_free()

func _animar():
	var tween: Tween=create_tween()
	tween.set_loops(0)#con 0 es infinito
	tween.tween_property(self,"position:y", position.y - 2, 1)
	tween.tween_property(self,"position:y", position.y + 2, 1)
