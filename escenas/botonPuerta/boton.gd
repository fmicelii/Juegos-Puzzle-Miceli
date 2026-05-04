extends Area2D

# siempre hay q asignar la "puerta" en el inspector al poner el boton
@export var puerta_asignada: StaticBody2D 
@export var animacion: AnimatedSprite2D

func _ready() -> void:
	body_entered.connect(_al_pisar)

func _al_pisar(body: Node) -> void:
	if body.is_in_group("personaje"):
		print("¡Botón pisado!")
		animacion.play("apretado")
		SonidosGlobales.reproducirSonidoPuerta()
		if puerta_asignada:
			puerta_asignada.queue_free()
