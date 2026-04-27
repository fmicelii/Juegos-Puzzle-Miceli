extends RigidBody2D

@export var animacion: AnimatedSprite2D
signal nivelPasado

func _ready() -> void:
	add_to_group("princesa")

func _process(_delta: float) -> void:
	animacion.play("idle")

func _on_area_2d_body_entered(_body: Node) -> void:
		# agarramos el contenedor y nos fijamos que esten todas agarradas para emitir 
		var contenedor = get_tree().get_first_node_in_group("contenedorRecolectables")
		if contenedor and contenedor.todosAgarrados:
			await get_tree().create_timer(1).timeout
			nivelPasado.emit() # le digo a la escena principal
		else:
			print("todavia tengo hambre, agarra mas hamburguesas")
