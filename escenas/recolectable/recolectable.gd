extends Node2D

@export var area2d: Area2D
var contenedorRecolectables: ContenedorRecolectables

func _ready() -> void:
	area2d.body_entered.connect(_recogida)
	_animar()

func _recogida(_body):
	# Llamas al Autoload antes de destruir el nodo
	SonidosGlobales.reproducirSonidoRecolectable()
	contenedorRecolectables.recolectableAgarrado()
	queue_free()

func _animar():
	#para hacer que suba y baje la burga
	var tween: Tween = create_tween()
	tween.set_loops(0)
	tween.tween_property(self,"position:y", position.y - 2, 1)
	tween.tween_property(self,"position:y", position.y + 2, 1)
