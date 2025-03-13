extends Node

@export var crowdDensity : int = 10
var crowdArray : Array [int]
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
			crowdArray.append(0)
			crowdDensity = crowdDensity - 1
		if crowdMem == 2:
			crowdArray.append(1)
			crowdDensity = crowdDensity - 1
		#Defualts just incase
		else:
			crowdArray.append(0)
			crowdDensity = crowdDensity - 1

func _populate():
	var areaDivi : int = 1
	for crowd in crowdArray:
		if areaDivi == 1:
			if crowd == 0:
				add_child(squareCrowd.instantiate().transform.position($Marker2D.transform.position))
				areaDivi = areaDivi + 1
			if crowd == 1:
				add_child(triangleCrowd.instantiate().transform.position($Marker2D.transform.position))
				areaDivi = areaDivi + 1
			else:
				add_child(squareCrowd.instantiate().transform.position($Marker2D.transform.position))
				areaDivi = areaDivi + 1
		if areaDivi == 2:
			if crowd == 0:
				add_child(squareCrowd.instantiate().transform.position($Marker2D.transform.position))
				areaDivi = areaDivi + 1
			if crowd == 1:
				add_child(triangleCrowd.instantiate().transform.position($Marker2D.transform.position))
				areaDivi = areaDivi + 1
			else:
				add_child(squareCrowd.instantiate().transform.position($Marker2D.transform.position))
				areaDivi = areaDivi + 1
		if areaDivi == 3:
			if crowd == 0:
				add_child(squareCrowd.instantiate().transform.position($Marker2D.transform.position))
				areaDivi = areaDivi + 1
			if crowd == 1:
				add_child(triangleCrowd.instantiate().transform.position($Marker2D.transform.position))
				areaDivi = areaDivi + 1
			else:
				add_child(squareCrowd.instantiate().transform.position($Marker2D.transform.position))
				areaDivi = areaDivi + 1
	print("Done")
