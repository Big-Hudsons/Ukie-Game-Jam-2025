extends Control
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

func _on_start_game_pressed() -> void:
	audio_stream_player.playing = true
	if audio_stream_player.finished:
		get_tree().change_scene_to_file("res://scenes/levels/level_1.tscn")

func _on_settings_pressed() -> void:
	pass # Replace with function body.

func _on_credits_pressed() -> void:
	pass # Replace with function body.


func _on_quit_pressed() -> void:
	get_tree().quit()
