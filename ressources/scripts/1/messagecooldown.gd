extends Node

func _ready() -> void:
	$audio.play()
	$Timer.start()
	var save = SD.read_save()
	if self.name == "2":
		save["games"]["1"]["levels"]["1"] = true
	if self.name == "3":
		save["games"]["1"]["levels"]["2"] = true
	if self.name == "4":
		save["games"]["1"]["levels"]["3"] = true
	if self.name == "5":
		save["games"]["1"]["levels"]["4"] = true
	if self.name == "win":
		save["games"]["1"]["star"] = true
	SD.write_save(save)

func _on_timer_timeout() -> void:
	if self.name == "1":
		get_tree().change_scene_to_file("res://ressources/scenes/1/levels/1.tscn")
	if self.name == "2":
		get_tree().change_scene_to_file("res://ressources/scenes/1/levels/2.tscn")
	if self.name == "3":
		get_tree().change_scene_to_file("res://ressources/scenes/1/levels/3.tscn")
	if self.name == "4":
		get_tree().change_scene_to_file("res://ressources/scenes/1/levels/4.tscn")
	if self.name == "5":
		get_tree().change_scene_to_file("res://ressources/scenes/1/levels/5.tscn")
	if self.name == "win":
		get_tree().change_scene_to_file("res://ressources/scenes/1/menu.tscn")
