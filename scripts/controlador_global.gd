extends Node

signal muertesActualizado

var muertes:int

func sumar_muerte():
	muertes+=1
	muertesActualizado.emit()
