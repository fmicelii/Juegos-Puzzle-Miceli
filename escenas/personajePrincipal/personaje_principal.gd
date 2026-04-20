extends CharacterBody2D

@export var animacion: AnimatedSprite2D
@export var area2d: Area2D
@export var efectoRojoPersonaje: ShaderMaterial

var _velocidadSalto: float = -250
var _velocidad: float = 100.0 #arranca con _ porque es una variable privada
var _muerto : bool #por defecto false
signal muertePersonaje

func _ready() -> void: 
	add_to_group("personajes")
	#conectamos por codigo para mas prolijidad y pq es buen habito
	area2d.body_entered.connect(_on_area_2d_body_entered)

func _physics_process(delta: float) -> void:
	if _muerto:
		return
	
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


func _on_area_2d_body_entered(_body: Node2D) -> void:
	animacion.material = efectoRojoPersonaje
	_muerto = true
	animacion.stop()
	await get_tree().create_timer(1).timeout
	muertePersonaje.emit()
