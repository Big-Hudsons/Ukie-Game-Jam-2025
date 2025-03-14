extends Control
@onready var button_clicked: AudioStreamPlayer = $ButtonClicked

func _on_start_game_pressed() -> void:
	button_clicked.playing = true
	get_tree().change_scene_to_file("res://scenes/levels/warning_scene.tscn")
		

func _on_credits_pressed() -> void:
	button_clicked.playing = true
	if button_clicked.finished :get_tree().change_scene_to_file("res://scenes/levels/credit_menu.tscn")
		

func _on_quit_pressed() -> void:
	button_clicked.playing = true
	get_tree().quit()
		
