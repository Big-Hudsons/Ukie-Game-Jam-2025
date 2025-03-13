extends Node

@export var crowdDensity : int = 10
var crowdArray : Array 
var crowdMem : int

#Crowd Members
var squareCrowd = preload("res://scenes/crowd/square_crowd.tscn")
var triangleCrowd = preload("res://scenes/crowd/triangle_crowd.tscn")

#Crowd Areas
@onready var area_1: Area2D = $Area1
@onready var area_2: Area2D = $Area2
@onready var area_3: Area2D = $Area3


func _ready() -> void:
	_generate_crowd()
	_populate()

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
			crowdDensity = crowdDensity - 1
	#Debug Stuff
	#for crowd in crowdArray:
		#print(crowd)

func _populate():
	var areaDivi : int = 1
	for crowd in crowdArray:
		var object = crowdArray[crowd.instantiate()]
		if areaDivi == 1:
			add_child(crowd)
			areaDivi = areaDivi + 1
			continue
		if areaDivi == 2:
			add_child(crowd)
			areaDivi = areaDivi + 1
			continue
		if areaDivi == 3:
			add_child(crowd)
			areaDivi = 1
			continue
	print("Done")
