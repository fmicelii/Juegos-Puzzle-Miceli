extends RigidBody2D

@export var animacion: AnimatedSprite2D
@export var contenedorRec: ContenedorRecolectables

signal nivelPasado

func _ready() -> void:
	add_to_group("princesa")

func _process(delta: float) -> void:
	animacion.play("idle")

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("personajes"):
		print("personaje entró")
		
		if contenedorRec and contenedorRec.todosAgarrados==true:
			print("nivel superado")
			nivelPasado.emit()
