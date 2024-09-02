extends Control

onready var Global_Radio = get_node("/root/Global_Radio")
onready var level = $MenuContainer/VBoxContainer/Level
onready var scene = $MenuContainer/VBoxContainer/Scene
onready var vitals = $MenuContainer/VBoxContainer/Vitals
onready var testseed = $MenuContainer/VBoxContainer/Seed

var hashedSeed

func get_selections():
	Global_Radio.level_selection = level.text
	Global_Radio.scene_selection = scene.text
	Global_Radio.vitals_selection = vitals.text
	Global_Radio.level = level.selected
	Global_Radio.scene = scene.selected
	Global_Radio.vitals = vitals.selected
	if testseed.text.length() == 0:
		var temp_seed_selection = ""
		var chars = 'abcdefghijklmnopqrstuvwxyz1234567890'
		var n_char = len(chars)
		for _i in range(8):
			temp_seed_selection += chars[randi()% n_char]
		
		testseed.text = temp_seed_selection
	Global_Radio.seed_selection = testseed.text
	#print("")
	#print("Menu Selections")
	#print("Level: ",Global.level_selection)
	#print("Med: ",Global.meds_selection)
	#print("Week: ",Global.week_selection)
	#print("Previous: ",Global.previous_selection)
	#print("Seed: ",Global.seed_selection)
	#print(Global.function_list)
	#print(Global.class_list)
	#print(Global.indication_list)
	#print(Global.contraindication_list)
	#print(Global.route_list)
	#print(Global.dose_list)

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	level.select(Global_Radio.level)
	scene.select(Global_Radio.scene)
	vitals.select(Global_Radio.vitals)
	testseed.text = ""

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass

func _on_Button_pressed():
	get_selections()
	var _trash = get_tree().change_scene("res://RadioTest.tscn")
