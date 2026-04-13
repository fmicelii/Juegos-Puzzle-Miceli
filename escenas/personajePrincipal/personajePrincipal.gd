extends CharacterBody2D

@export var animacion: AnimatedSprite2D
var _velocidadSalto: float = -250
var _velocidad: float = 100.0 #arranca con _ porque es una variable privada

func _physics_process(delta: float) -> void:
	#gravedad 
	velocity += get_gravity() *delta #get_gravity nos devuelve un vector2(x,y). getgravity le suma la gravedad en y a velocity 
	
	if !is_on_floor():
		animacion.play("saltar")
	elif velocity.x != 0:
		animacion.play("correr")
	else:
		animacion.play("idle")
	
	#saltar
	if is_on_floor() && Input.is_action_just_pressed("movimientoSaltar"):
		velocity.y = _velocidadSalto
	
	#movimiento lateral flechitas
	if Input.is_action_pressed("movimientoDerecha"):
		animacion.flip_h=true
		velocity.x =_velocidad
	elif Input.is_action_pressed("movimientoIzquierda"):
		animacion.flip_h=false
		velocity.x= -_velocidad
	else:
		velocity.x = 0
	move_and_slide()
