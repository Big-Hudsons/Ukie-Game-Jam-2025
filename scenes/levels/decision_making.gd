extends Control

var current_question_index = -1
var current_question = null
var morality = 0
var money = 100
var emorality = 0
var emoney = 100
var roundCounter = 0

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
	#$"Player Morality".text = "Player Morality: %d\nPlayer Money: %d" % [morality, money]
	#$"Enemy Morality".text = "Enemy Morality: %d\nEnemy Money: %d" % [emorality,emoney]
	$GameUI/BlueSideUI/Morality/BlueMortalityText.text = "%d" % [morality] + "%"
	$GameUI/BlueSideUI/Money/BlueMoneyText.text = "%d" % [money] + "M"
	$GameUI/RedSide/Morality/RedMoralityText.text = "%d" % [emorality] + "%"
	$GameUI/RedSide/Money/RedMoneyText.text = "%d" % [emoney] + "M"
	$"Round Counter".text = "Round: " + str(roundCounter)

func calculation(Player_Choice):
	# Player Choice
	var player_calc = current_question["responses"][Player_Choice]["effects"]
	morality += player_calc.get("morality", 0)
	money += player_calc.get("money", 0)
	roundCounter += 1

#Enemy Takes the other option
#This give either choice 1 or 0 depending on what the player chose
	var Enemy_Choice = 1 - Player_Choice
	var enemy_calc = current_question["responses"][Enemy_Choice]["effects"]
	emorality += enemy_calc.get("morality", 0)
	emoney += enemy_calc.get("money", 0)

	update_display()
	load_new_question()

func _on_response_1_pressed() -> void:
	if current_question:
		calculation(0) 
#this makes choice one 0

func _on_response_2_pressed() -> void:
	if current_question:
		calculation(1)
#this makes choice two 1
