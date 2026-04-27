extends Button

@export var menuInicial: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(_volver)

func _volver():
	get_tree().change_scene_to_packed(menuInicial)
	
