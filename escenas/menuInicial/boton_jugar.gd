extends Button

@export var escenaPrincipal: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(_jugar)

func _jugar():
	get_tree().change_scene_to_packed(escenaPrincipal)
