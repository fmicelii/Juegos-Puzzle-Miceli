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
	for hijo in hijos:
		if hijo.is_in_group("personajes"):
			hijo.muertePersonaje.connect(_reiniciarNivel)
		# vamos a un IF independiente para que revise todos los nodos
		if hijo.is_in_group("princesa"):
			hijo.nivelPasado.connect(pasarNivel)

func _eliminarNivel():
	_nivelActualInstancia.queue_free() #queue_free es para eliminar nodo y todos los hijos 
#( queue_free agrega este nodo a la cola de nodos que sera eliminados

func _reiniciarNivel():
	_eliminarNivel()
	_crearNivel.call_deferred(_nivelActual) #Calls the method in deferred mode, at the end of the current framee

func pasarNivel():
	_nivelActual +=1
	_eliminarNivel()
	_crearNivel.call_deferred(_nivelActual) 
	#no llamo a reiniciarNivel porque aunque hacen lo mismo,
	# se da a entenderr que reinicio el nivel cuando no lo hago. Lo dejo asi para mejor entendimiento
	
