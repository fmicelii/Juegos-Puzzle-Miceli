extends Node
class_name ContenedorRecolectables

var _totalRecolectables: int
var _recolectablesAgarrados:int

signal nivelPasado


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("contenedorRecolectables")
	var recolectables := get_children()
	_totalRecolectables= recolectables.size()
	
	for recolectable in recolectables:
		recolectable.contenedorRecolectables=self

func recolectableAgarrado():
	_recolectablesAgarrados +=1
	if _recolectablesAgarrados == _totalRecolectables:
		print("nivel completado")
		nivelPasado.emit()
