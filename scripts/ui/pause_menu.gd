extends Control

var pauseMenu : bool = false
@onready var pause_audio: AudioStreamPlayer = $PauseAudio

func _ready():
	self.visible = false

func _process(delta):
	if Input.is_action_just_pressed("Escape"):
		_displayPause()
		
func _displayPause():
	if (pauseMenu == true):
		pauseMenu = false
		self.visible = false
		$"../DecisionMaking/GameUI/Approval Bar".visible = true
	else: if (pauseMenu == false):
		pauseMenu = true
		self.visible = true
		$"../DecisionMaking/GameUI/Approval Bar".visible = false

func _on_resume_pressed() -> void:
	pause_audio.playing = true
	_displayPause()

func _on_resign_pressed() -> void:
	pause_audio.playing = true
	if pause_audio.finished :
		get_tree().change_scene_to_file("res://scenes/levels/main_menu.tscn")
