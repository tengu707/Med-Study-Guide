extends VBoxContainer


var items = []
var choosen_answer = ""
var choosen_answer_id = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func add_item(text):
	if choosen_answer == "":
		choosen_answer = text
	var hbox = HBoxContainer.new()
	add_child(hbox)
	var cbox = CheckBox.new()
	hbox.add_child(cbox)
	var tbox = RichTextLabel.new()
	tbox.fit_content_height = true
	tbox.rect_min_size.x = 300
	tbox.text = text
	hbox.add_child(tbox)
	var index = items.size()
	items.append({"hbox": hbox, "cbox": cbox, "tbox": tbox, "index": index})
	cbox.connect("pressed", self, "_on_CheckBox_pressed", [index])

func set_item_text(id, text):
	items[id].tbox.text = text

func _on_CheckBox_pressed(index: int):
	choosen_answer = items[index].tbox.text
	choosen_answer_id = index
	for item in items:
		item.cbox.pressed = item.index == index
