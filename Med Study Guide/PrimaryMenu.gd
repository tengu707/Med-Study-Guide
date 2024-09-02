extends Control

onready var Global_Primary = get_node("/root/Global_Primary")
onready var level = $MenuContainer/VBoxContainer/Level
onready var testseed = $MenuContainer/VBoxContainer/Seed

var hashedSeed

func get_selections():
	Global_Primary.level_selection = level.text
	Global_Primary.level = level.selected
	if testseed.text.length() == 0:
		var temp_seed_selection = ""
		var chars = 'abcdefghijklmnopqrstuvwxyz1234567890'
		var n_char = len(chars)
		for _i in range(8):
			temp_seed_selection += chars[randi()% n_char]
		
		testseed.text = temp_seed_selection
	Global_Primary.seed_selection = testseed.text
	
func _ready():
	randomize()
	level.select(Global_Primary.level)
	testseed.text = ""

func _on_Button_pressed():
	get_selections()
	var _trash = get_tree().change_scene("res://PrimaryAssessment.tscn")
