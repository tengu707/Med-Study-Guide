extends Control

func _on_Med_Button_pressed():
	var _trash = get_tree().change_scene("res://MedMenu.tscn")

func _on_Radio_Button_pressed():
	var _trash = get_tree().change_scene("res://RadioMenu.tscn")

func _on_Primary_Assessment_Button_pressed():
	var _trash = get_tree().change_scene("res://PrimaryMenu.tscn")
