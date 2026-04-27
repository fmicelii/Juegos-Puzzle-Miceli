extends Node

signal muertesActualizado

var muertes_totales: int = 0
var muertes:int

func sumar_muerte():
	muertes+=1
	muertesActualizado.emit()
