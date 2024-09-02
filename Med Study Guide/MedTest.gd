extends Control

onready var Global_Med = get_node("/root/Global_Med")
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
	if Global_Med.level_selection != "Fill In":
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

func _ready():
	$VBoxContainer2/RichTextLabel.text = "Seed: " + Global_Med.seed_selection
	rng.seed = hash(Global_Med.seed_selection)
	for i in Global_Med.meds:
		if i.week == Global_Med.week_selection:
			if Global_Med.meds_selection != "Paramedic":
				create_label("Week " + Global_Med.week_selection + " Generic Meds")
				create_spacer()
				var rng_generic_list = shuffleList(i.generic_list)
				for j in rng_generic_list:
					create_label(j.brand + " : " + j.generic)
					for m in j.function:
						create_answer(Global_Med.function_list, m, j.function)
					create_spacer()
				create_label("Week " + Global_Med.week_selection + " Paramedic Meds")
				create_spacer()
			if Global_Med.meds_selection != "Generic":
				var rng_paramedic_list = shuffleList(i.paramedic_list)
				for k in rng_paramedic_list:
					create_label("Medication: " + k.Medication)
					create_label("Class")
					create_answer(Global_Med.class_list, k.Class, k.Class)
					create_label("Indications")
					for l in k.Indications:
						create_answer(Global_Med.indication_list, l, k.Indications)
					create_label("Contraindications")
					for l in k.Contraindications:
						create_answer(Global_Med.contraindication_list, l, k.Contraindications)
					create_label("Routes")
					for l in k.Routes:
						create_answer(Global_Med.route_list, l, k.Routes)
					create_label("Dose")
					create_answer(Global_Med.dose_list, k.Dose, k.Dose)
					create_spacer()
	if Global_Med.previous_selection == "Yes":
		var random_generic_list = []
		var random_paramedic_list = []
		for i in Global_Med.med:
			if Global_Med.week_selection > i.week:
				random_generic_list.append_array(i.generic_list)
				random_paramedic_list.append_array(i.paramedic_list)
		if Global_Med.meds_selection != "Paramedic":
			create_label("Random Generic Meds")
			create_spacer()
			for i in 5:
				var random_generic = rng.randi_range(0, len(random_generic_list) - 1)
				var rng_med = random_generic_list[random_generic]
				random_generic_list.remove(random_generic)
				create_label(rng_med.brand + " : " + rng_med.generic)
				for m in rng_med.function:
					create_answer(Global_Med.function_list, m, rng_med.function)
				create_spacer()
		if Global_Med.meds_selection != "Generic":
			create_label("Random Paramedic Meds")
			create_spacer()
			for i in 2:
				var random_paramedic = rng.randi_range(0, len(random_paramedic_list) - 1)
				var rng_paramedic = random_paramedic_list[random_paramedic]
				random_paramedic_list.remove(random_paramedic)
				create_label("Medication: " + rng_paramedic.Medication)
				create_label("Class")
				create_answer(Global_Med.class_list, rng_paramedic.Class, rng_paramedic.Class)
				create_label("Indications")
				for l in rng_paramedic.Indications:
					create_answer(Global_Med.indication_list, l, rng_paramedic.Indications)
				create_label("Contraindications")
				for l in rng_paramedic.Contraindications:
					create_answer(Global_Med.contraindication_list, l, rng_paramedic.Contraindications)
				create_label("Routes")
				for l in rng_paramedic.Routes:
					create_answer(Global_Med.route_list, l, rng_paramedic.Routes)
				create_label("Dose")
				create_answer(Global_Med.dose_list, rng_paramedic.Dose, rng_paramedic.Dose)
				create_spacer()

#func _input(event):
	#if event.is_action("ui_page_up"):
		#scroll.value -= 1
	#elif event.is_action("ui_page_down"):
		#scroll.value += 1

func _on_Button_pressed():
	$VBoxContainer2/Button.disabled = true
	var number_correct = 0
	if Global_Med.level_selection == "Multiple Choice":
		for answer in answers:
			answer.choosen_answer = answer.node.choosen_answer
			if answer.choosen_answer == answer.correct_answer:
				answer.grade = true
				number_correct += 1
				answer.node.items[answer.node.choosen_answer_id].tbox.set_theme(load("res://correct.tres"))
			else:
				answer.node.items[answer.node.choosen_answer_id].tbox.set_theme(load("res://incorrect.tres"))
				answer.node.set_item_text(answer.node.choosen_answer_id, answer.node.choosen_answer + "| Correct Answer: " + answer.correct_answer)
	elif Global_Med.level_selection == "Fill In":
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

func _on_Button2_pressed():
	var _trash = get_tree().change_scene("res://MedMenu.tscn")
