extends Control

onready var Global_Med = get_node("/root/Global_Med")
onready var level = $MenuContainer/VBoxContainer/Level
onready var meds = $MenuContainer/VBoxContainer/Meds
onready var week = $MenuContainer/VBoxContainer/Week
onready var previous = $MenuContainer/VBoxContainer/Previous
onready var testseed = $MenuContainer/VBoxContainer/Seed

var hashedSeed

func get_selections():
	Global_Med.level_selection = level.text
	Global_Med.meds_selection = meds.text
	Global_Med.week_selection = week.text
	if week.text == "1":
		Global_Med.previous_selection = "No"
	else:
		Global_Med.previous_selection = previous.text
	Global_Med.level = level.selected
	Global_Med.med = meds.selected
	Global_Med.week = week.selected
	Global_Med.previous = previous.selected
	if testseed.text.length() == 0:
		var temp_seed_selection = ""
		var chars = 'abcdefghijklmnopqrstuvwxyz1234567890'
		var n_char = len(chars)
		for _i in range(8):
			temp_seed_selection += chars[randi()% n_char]
		
		testseed.text = temp_seed_selection
	Global_Med.seed_selection = testseed.text
	print("")
	print("Menu Selections")
	print("Level: ",Global_Med.level_selection)
	print("Med: ",Global_Med.meds_selection)
	#print("Week: ",Global.week_selection)
	#print("Previous: ",Global.previous_selection)
	#print("Seed: ",Global.seed_selection)
	#print(Global.function_list)
	#print(Global.class_list)
	#print(Global.indication_list)
	#print(Global.contraindication_list)
	#print(Global.route_list)
	#print(Global_Med.dose_list)

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	level.select(Global_Med.level)
	meds.select(Global_Med.med)
	week.select(Global_Med.week)
	previous.select(Global_Med.previous)
	testseed.text = ""

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass

func _on_Button_pressed():
	get_selections()
	var _trash = get_tree().change_scene("res://MedTest.tscn")
