extends Control

onready var Global_Primary = get_node("/root/Global_Primary")
onready var box = $ScrollContainer/HBoxContainer/VBoxContainer

var rng = RandomNumberGenerator.new()
var answers = []
var v_size = 0

func shuffleList(list):
	var shuffledList = [] 
	var indexList = range(list.size())
	for _i in range(list.size()):
		var x = rng.randi_range(0,indexList.size()-1)
		shuffledList.append(list[indexList[x]])
		indexList.remove(x)
	return shuffledList

func create_label(text):
	var text_node = RichTextLabel.new()
	text_node.text = text
	text_node.rect_min_size = Vector2(0,25)
	box.add_child(text_node)
	print("Label Created")
	
func create_answer(incorrect_answer_list, correct_answer, correct_answer_list):
	if Global_Primary.level_selection != "Fill In":
		var scene = load("res://multiple choice.tscn")
		var answer = scene.instance()
		var random_correct = rng.randi_range(0,3)
		var incorrect_list := []
		for i in incorrect_answer_list:
			var check = true
			for j in correct_answer_list:
				if i == j:
					check = false
			if check:
				incorrect_list.append(i)
		for i in range(0,4):
			if random_correct == i:
				answer.add_item(correct_answer)
			else:
				var random_incorrect = rng.randi_range(0,len(incorrect_list)-1)
				answer.add_item(incorrect_list[random_incorrect])
				incorrect_list.remove(random_incorrect)
		answers.append({"node": answer, "correct_answer": correct_answer, "choosen_answer": "", "grade": false})
		box.add_child(answer)
	else:
		var scene = load("res://autoline.tscn")
		var answer = scene.instance()
		answer.possible_answers = shuffleList(incorrect_answer_list)
		answers.append({"node": answer, "correct_answer": correct_answer, "choosen_answer": "", "grade": false})
		box.add_child(answer)
	create_spacer()
	print("Answer Created")

func create_spacer():
	var spacer = HSeparator.new()
	spacer.rect_min_size.y = 10
	box.add_child(spacer)

func _reveal_pressed(b,r):
	b.text = r

func create_reveal(inital, reveal):
	var button = Button.new()
	button.name = inital+reveal
	button.text = inital
	button.connect("pressed", self, "_reveal_pressed", [button, reveal])
	box.add_child(button)

	
func _ready():
	randomize()
	$VBoxContainer2/RichTextLabel.text = "Seed: " + Global_Primary.seed_selection
	rng.seed = hash(Global_Primary.seed_selection)
	for i in 5:
		var scenarios = shuffleList(Global_Primary.primary)
		var scenario = scenarios[0]
		var incorrect = [scenarios[1].priorities,scenarios[2].priorities,scenarios[3].priorities]
		var sex 
		if (rng.randi_range(0,1) == 1): sex = "male"
		else: sex = "female"
		create_label("Dispatched to a " + str(rng.randi_range(scenario.ageMin, scenario.ageMax) ) 
		+ " year old " + sex) 
		create_label("chief complaint of " + scenario.chiefComplaint)
		create_reveal("Mental Status", scenario.mentalStatus)
		create_reveal("Airway", scenario.airway)
		create_reveal("Breathing", scenario.breathing)
		create_reveal("Circulation", scenario.circulation)
		create_answer(incorrect,scenario.priorities,scenario.priorities)

func _on_Button2_pressed():
	var _trash = get_tree().change_scene("res://PrimaryMenu.tscn")


func _on_Button_pressed():
	$VBoxContainer2/Button.disabled = true
	var number_correct = 0
	if Global_Primary.level_selection == "Multiple Choice":
		for answer in answers:
			answer.choosen_answer = answer.node.choosen_answer
			if answer.choosen_answer == answer.correct_answer:
				answer.grade = true
				number_correct += 1
				answer.node.items[answer.node.choosen_answer_id].tbox.set_theme(load("res://correct.tres"))
			else:
				answer.node.items[answer.node.choosen_answer_id].tbox.set_theme(load("res://incorrect.tres"))
				answer.node.set_item_text(answer.node.choosen_answer_id, answer.node.choosen_answer + "| Correct Answer: " + answer.correct_answer)
	elif Global_Primary.level_selection == "Fill In":
		for answer in answers:
			answer.choosen_answer = answer.node.choosen_answer
			if answer.choosen_answer.to_lower() == answer.correct_answer.to_lower():
				answer.grade = true
				number_correct += 1
				answer.node.set_theme(load("res://correct.tres"))
			else:
				answer.node.set_theme(load("res://incorrect.tres"))
				answer.node.text += "| Correct Answer: " + answer.correct_answer
	$VBoxContainer2/RichTextLabel2.text = str(number_correct) + "/" + str(len(answers)) +" Correct Answers"
