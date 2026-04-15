extends Node2D

@export var niveles: Array[PackedScene]

var _nivelActual: int = 1
var _nivelActualInstancia: Node



func _ready() -> void:
	_crearNivel(_nivelActual)


func _crearNivel(numeroNivel :int):
	_nivelActualInstancia =niveles[numeroNivel-1].instantiate()
	add_child(_nivelActualInstancia)
	
						#:= es para decir que la variable sea del tipo del que le estamos metiendo
	var hijos := _nivelActualInstancia.get_children() #agarra todos los hijos personajes
	for i in hijos.size():
		if hijos[i].is_in_group("personajes"):
			hijos[i].muertePersonaje.connect(_reiniciarNivel())
			break
			

func _eliminarNivel():
	_nivelActualInstancia.queue_free() #queue_free es para eliminar nodo y todos los hijos 
																			#(añadir este nodo a la cola de nodos que sera eliminados

func _reiniciarNivel():
	_eliminarNivel()
	_crearNivel(_nivelActual)
