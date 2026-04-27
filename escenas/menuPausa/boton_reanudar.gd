extends Button

func _ready() -> void:
	pressed.connect(_reanudar)

func _reanudar():
	#owner es el CanvasLayer (pausa). Le decimos que ejecute la función
	owner.alternar_pausa()
