extends Node2D

@export var area2d: Area2D
var contenedorRecolectables: ContenedorRecolectables

func _ready() -> void:
	area2d.body_entered.connect(_recogida)
	_animar()

func _recogida(_body):
	contenedorRecolectables.recolectableAgarrado()
	# Llamas al Autoload antes de destruir el nodo
	SonidosGlobales.reproducirSonidoRecolectable()
	queue_free()

func _animar():
	var tween: Tween = create_tween()
	tween.set_loops(0)
	tween.tween_property(self,"position:y", position.y - 2, 1)
	tween.tween_property(self,"position:y", position.y + 2, 1)
