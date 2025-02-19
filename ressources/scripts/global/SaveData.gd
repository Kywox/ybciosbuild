extends Node

const default_data = "res://ressources/scripts/global/default_data.json"
var json = JSON.new()
var path = "user://save_data.json"

var data = {}

func write_save(content):
	var file = FileAccess.open(path, FileAccess.WRITE)
	file.store_string(json.stringify(content))
	file.close()
	file = null

func read_save():
	var file = FileAccess.open(path, FileAccess.READ)
	var content = json.parse_string(file.get_as_text())
	return content

func create_new_save_file():
	var file = FileAccess.open(default_data, FileAccess.READ)
	var content = json.parse_string(file.get_as_text())
	data  = content;
	write_save(content)

func _ready():
	if FileAccess.file_exists(path):
		print("Save Exists!")
	else:
		create_new_save_file()
		print("Created Save")
