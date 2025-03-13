extends Node

@export var crowdDensity : int = 10
var crowdArray : Array
var crowdMem : int

var squareCrowd = preload("res://scenes/crowd/square_crowd.tscn")
var triangleCrowd = preload("res://scenes/crowd/triangle_crowd.tscn")

func _ready() -> void:
	_generate_crowd()

func _generate_crowd():
	while crowdDensity >= 0:
		crowdMem = randi_range(1, 2)
		if crowdMem == 1:
			crowdArray.append(squareCrowd)
			crowdDensity = crowdDensity - 1
		if crowdMem == 2:
			crowdArray.append(triangleCrowd)
			crowdDensity = crowdDensity - 1
		#Defualts just incase
		else:
			crowdArray.append(squareCrowd)
			crowdDensity - 1
	#Debug Stuff
	#for crowd in crowdArray:
		#print(crowd)
