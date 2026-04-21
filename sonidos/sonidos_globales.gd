extends Node
#var nombre... : AudioStreamPlayer
var reproductorSonidoRecolectable: AudioStreamPlayer
var reproductorSonidoMuerte: AudioStreamPlayer 


func _ready() -> void:
	#recolectado
	reproductorSonidoRecolectable = AudioStreamPlayer.new()
	add_child(reproductorSonidoRecolectable)
	reproductorSonidoRecolectable.stream = preload("res://sonidos/sonido_recoleccion.mp3")
	reproductorSonidoRecolectable.set_bus("SFX")
	
	#muerte
	reproductorSonidoMuerte = AudioStreamPlayer.new()
	add_child(reproductorSonidoMuerte)
	reproductorSonidoMuerte.stream = preload("res://sonidos/sonido_muerte.mp3") 
	reproductorSonidoMuerte.set_bus("SFX")

func reproducirSonidoRecolectable() -> void:
	reproductorSonidoRecolectable.play()

# 3. Creás la función para reproducirlo
func reproducirSonidoMuerte() -> void:
	reproductorSonidoMuerte.play()
