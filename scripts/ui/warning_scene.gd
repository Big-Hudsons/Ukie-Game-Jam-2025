extends Control

func _ready() -> void:
	_start_timer()

func _start_timer() -> void:
	print("timer start")
	await get_tree().create_timer(3.0).timeout
	print("timer done")
	get_tree().change_scene_to_file("res://scenes/levels/tutorial_scene.tscn")
