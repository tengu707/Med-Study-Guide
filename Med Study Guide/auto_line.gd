extends LineEdit

onready var popup = $PopupMenu2
var possible_answers := []
var choosen_answer := ""

func _on_Control_text_changed(new_text):
	popup.visible = true
	popup.rect_position = get_global_position() + Vector2(0,rect_size.y)
	popup.clear()
	choosen_answer = text
	for i in possible_answers:
		if text.to_lower() in i.to_lower():
			popup.add_item(i)

func _on_PopupMenu2_id_pressed(id):
	text = popup.get_item_text(id)
	choosen_answer = text
