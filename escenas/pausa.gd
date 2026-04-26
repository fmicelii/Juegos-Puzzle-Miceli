extends CanvasLayer

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pausa"):
		alternar_pausa() # Llamamos a la nueva función

# Creamos la función que hace la magia
func alternar_pausa():
	get_tree().paused = !get_tree().paused
	var hijos := get_children()
	for hijo in hijos:
		hijo.visible = !hijo.visible
