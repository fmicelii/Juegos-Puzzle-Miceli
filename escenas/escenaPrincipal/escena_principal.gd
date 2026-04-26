extends Node2D

@export var niveles: Array[PackedScene]

var _nivelActual: int = 1
var _nivelActualInstancia: Node

func _ready() -> void:
	_crearNivel(_nivelActual)

func _crearNivel(numeroNivel :int):
	_nivelActualInstancia = niveles[numeroNivel-1].instantiate()
	add_child(_nivelActualInstancia) # Al añadirlo, se ejecutan los _ready de los hijos
	
	var personaje = get_tree().get_first_node_in_group("personaje")
	if personaje:
		personaje.muertePersonaje.connect(_reiniciarNivel)

	var princesa = get_tree().get_first_node_in_group("princesa")
	if princesa:
		princesa.nivelPasado.connect(pasarNivel)

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
	
