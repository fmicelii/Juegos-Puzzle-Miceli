extends Node
#var nombre... : AudioStreamPlayer
var reproductorSonidoSalto: AudioStreamPlayer
var reproductorSonidoPuerta: AudioStreamPlayer
var reproductorSonidoBeso: AudioStreamPlayer
var reproductorSonidoCosito: AudioStreamPlayer
var reproductorSonidoRecolectable: AudioStreamPlayer
var reproductorSonidoMuerte: AudioStreamPlayer 


func _ready() -> void:
	#recolectado
	reproductorSonidoRecolectable = AudioStreamPlayer.new()
	add_child(reproductorSonidoRecolectable)
	reproductorSonidoRecolectable.stream = preload("res://sonidos/sonidoRecolectable.wav")
	reproductorSonidoRecolectable.set_bus("SFX")
	
	#muerte
	reproductorSonidoMuerte = AudioStreamPlayer.new()
	add_child(reproductorSonidoMuerte)
	reproductorSonidoMuerte.stream = preload("res://sonidos/sonidoMuerte.wav") 
	reproductorSonidoMuerte.set_bus("SFX")

	#beso
	reproductorSonidoBeso = AudioStreamPlayer.new()
	add_child(reproductorSonidoBeso)
	reproductorSonidoBeso.stream = preload("res://sonidos/kiss.wav")
	reproductorSonidoBeso.set_bus("SFX")
	
	#cosito
	reproductorSonidoCosito = AudioStreamPlayer.new()
	add_child(reproductorSonidoCosito)
	reproductorSonidoCosito.stream = preload("res://sonidos/hornBlown.wav")
	reproductorSonidoCosito.set_bus("SFX")

	#puerta
	reproductorSonidoPuerta = AudioStreamPlayer.new()
	add_child(reproductorSonidoPuerta)
	reproductorSonidoPuerta.stream = preload("res://sonidos/door.wav")
	reproductorSonidoPuerta.set_bus("SFX")
	
	#salto
	reproductorSonidoSalto = AudioStreamPlayer.new()
	add_child(reproductorSonidoSalto)
	reproductorSonidoSalto.stream = preload("res://sonidos/jump.wav")
	reproductorSonidoSalto.set_bus("SFX")
		
func reproducirSonidoRecolectable() -> void:
	reproductorSonidoRecolectable.play()

func reproducirSonidoMuerte() -> void:
	reproductorSonidoMuerte.play()

func reproducirSonidoBeso():
	reproductorSonidoBeso.play()

func reproducirSonidoCosito():
	reproductorSonidoCosito.play()
	
func reproducirSonidoPuerta():
	reproductorSonidoPuerta.play()

func reproducirSonidoSalto():
	reproductorSonidoSalto.play()
