extends Control

var current_question_index = -1
var current_question = null
var morality = 0
var money = 100
var emorality = 0
var emoney = 100
var roundCounter = 0
var approval = 0
var gameOver = false

func _ready():
	randomize()
	load_new_question()
	update_display()
	$"Game Over/GameOverButton".visible = false


func load_new_question():
	if QuestionData.Questions.size() > 0:
		current_question_index = randi() % QuestionData.Questions.size()
		current_question = QuestionData.Questions[current_question_index]
		update_question_display()


func update_question_display():
	if current_question:
		$"Button Control/Question".text = current_question["question"]

		var responses = current_question["responses"]

		for i in range(responses.size()):
			var button = get_node("Button Control/Response" + str(i+1))
			if button:
				button.text = responses[i]["text"]
			else:
				print("Button Count Error")


func update_display():
	$GameUI/BlueSideUI/Morality/BlueMorality.text = "%d" % [morality] + "%"
	$GameUI/BlueSideUI/Money/BlueMoney.text = "%d" % [money] + "M"
	$GameUI/RedSide/Morality/RedMorality.text = "%d" % [emorality] + "%"
	$GameUI/RedSide/Money/RedMoney.text = "%d" % [emoney] + "M"
	$"Button Control/RoundCounter".text = "Round: " + str(roundCounter)
	
	approval = (morality + money) - (emorality + emoney)
	approval = clamp(approval, 0, 100)
	$"Approval Bar/HSlider".value = approval
	


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
	
	if roundCounter >= 10:
		calculate_approval()
		GameOver()
		return
		
	if not gameOver:
		load_new_question()

func calculate_approval(): 
	approval = (morality + money) - (emorality + emoney)
	approval = clamp(approval, 0, 100)
	return approval


func GameOver():
	gameOver = true
	disable_buttons()
	gameResult()


func disable_buttons():
	$"Button Control/Response1".disabled = true
	$"Button Control/Response2".disabled = true


func gameResult():
	var Result = "You %s! Approval: %d%%" % ["Win" if approval >= 50 else "Lose", approval]
	$"Game Over/Label".visible  = true
	$"Game Over/Label".text = Result
	$"Game Over/GameOverButton".visible = true

func _on_response_1_pressed() -> void:
	if current_question:
		calculation(0) 
#this makes choice one 0
func _on_response_2_pressed() -> void:
	if current_question:
		calculation(1)
#this makes choice two 1

func _on_main_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/main_menu.tscn")
