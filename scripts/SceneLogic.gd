extends Control

var current_question_index = -1
var current_question = null
var morality = 0
var money = 100

func _ready():
	randomize()
	load_new_question()
	update_display()

func load_new_question():
	if QuestionData.Questions.size() > 0:
		current_question_index = randi() % QuestionData.Questions.size()
		current_question = QuestionData.Questions[current_question_index]
		update_question_display()

func update_question_display():
	if current_question:
		$"Button Control/Label".text = current_question["question"]
		
		var responses = current_question["responses"]

		
		for i in range(responses.size()):
			var button = get_node("Button Control/Response" + str(i+1))
			if button:
				button.text = responses[i]["text"]
			else:
				print("Button Count Error")

func update_display():
	$Morality.text = "Morality: %d\nMoney: %d" % [morality,money]


func calculation(effects):
	morality += effects.get("morality", 0)
	money += effects.get("money", 0)
	update_display()
	load_new_question()


func _on_response_1_pressed() -> void:
	if current_question:
		var effects = current_question["responses"][0]["effects"]
		calculation(effects)


func _on_response_2_pressed() -> void:
	if current_question:
		var effects = current_question["responses"][1]["effects"]
		calculation(effects)
