extends Node

var Questions = []
var data_file_path = "res://scripts/questions.json"

func _ready():
	Questions = load_json_file(data_file_path)

func load_json_file(filePath : String):
	if FileAccess.file_exists(filePath):
		
		var dataFile = FileAccess.open(filePath, FileAccess.READ)
		var parsedResult = JSON.parse_string(dataFile.get_as_text())
		
		return parsedResult
