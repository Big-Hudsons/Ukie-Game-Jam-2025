extends Node

@export var crowdDensity : int = 10
var crowdArray : Array [int]
var crowdMem : int

#Crowd Members
var squareCrowd = preload("res://scenes/crowd/square_crowd.tscn")
var triangleCrowd = preload("res://scenes/crowd/triangle_crowd.tscn")

#shaders
const COLOR_CHANGE = preload("res://shaders/color_change.gdshader")

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
	var loopCount : int = 0
	for crowd in crowdArray:
		loopCount = loopCount + 1
		var square = squareCrowd.instantiate()
		var triangle = triangleCrowd.instantiate()
		if areaDivi == 1:
			if crowd == 0:
				square.position = Vector2(_random_area_pos(area_1))
				square.name = ("Square Crowd " + str(loopCount))
				add_child(square)
				areaDivi = areaDivi + 1
				continue
			if crowd == 1:
				triangle.position = Vector2(_random_area_pos(area_1))
				triangle.name = ("triangle Crowd " + str(loopCount))
				add_child(triangle)
				areaDivi = areaDivi + 1
				continue
			else:
				square.position = Vector2(_random_area_pos(area_1))
				square.name = ("Square Crowd " + str(loopCount))
				add_child(square)
				areaDivi = areaDivi + 1
				continue
		if areaDivi == 2:
			if crowd == 0:
				square.position = Vector2(_random_area_pos(area_2))
				square.name = ("Square Crowd " + str(loopCount))
				add_child(square)
				areaDivi = areaDivi + 1
				continue
			if crowd == 1:
				triangle.position = Vector2(_random_area_pos(area_2))
				triangle.name = ("triangle Crowd " + str(loopCount))
				add_child(triangle)
				areaDivi = areaDivi + 1
				continue
			else:
				square.position = Vector2(_random_area_pos(area_2))
				square.name = ("Square Crowd " + str(loopCount))
				add_child(square)
				areaDivi = areaDivi + 1
				continue
		if areaDivi == 3:
			if crowd == 0:
				square.position = Vector2(_random_area_pos(area_3))
				square.name = ("Square Crowd " + str(loopCount))
				add_child(square)
				areaDivi = 1
				continue
			if crowd == 1:
				triangle.position = Vector2(_random_area_pos(area_3))
				triangle.name = ("triangle Crowd " + str(loopCount))
				add_child(triangle)
				areaDivi = 1
				continue
			else:
				square.position = Vector2(_random_area_pos(area_3))
				square.name = ("Square Crowd " + str(loopCount))
				add_child(square)
				areaDivi = 1
				continue

func _random_area_pos(area: Area2D):
	#var spawnArea = area.child.name == CollisionShape2D.shape.get_rect().get_area()
	var spawnArea = area.get_node("CollisionShape2D")
	var surfaceArea = spawnArea.shape.extents
	var origin = spawnArea.global_position - surfaceArea
	
	var min_x = origin.x
	var max_x = origin.x + 2 * surfaceArea.x
	var min_y = origin.y
	var max_y = origin.y + 2 * surfaceArea.y
	
	var x = randf_range(min_x, max_x)
	var y = randf_range(min_y, max_y)
	
	return Vector2(x, y)


func _on_decision_making_load_question(approval) -> void:
	var approvalLoop = approval
	for c in $".".get_children():
		if c.has_node("AnimatedSprite2D"):
			var animS = c.get_node("AnimatedSprite2D")
			if animS.material != null:
					#if that matterial is the red shader
					#animS.material.shader = null
				animS.material = animS.material.duplicate()
				animS.material.set_shader_parameter("replace_color", Vector4(1,0,0,1))
		else: 
			continue
	#BLUE shader Generation
	for c in $".".get_children():
		if c.has_node("AnimatedSprite2D"):
			var animS = c.get_node("AnimatedSprite2D")
			if approvalLoop > 0:
					animS.material = animS.material.duplicate()
					animS.material.set_shader_parameter("replace_color", Vector4(0,0,1,1))
					approvalLoop = approvalLoop - 1
					continue
