extends Control

func _ready() -> void:
	var save = SD.read_save()
	$levels/Button.disabled = false
	if save["games"]["1"]["levels"]["1"] == true:
		$levels/Button2.disabled = false
	else:
		$levels/Button2.disabled = true
	if save["games"]["1"]["levels"]["2"] == true:
		$levels/Button3.disabled = false
	else:
		$levels/Button3.disabled = true
	if save["games"]["1"]["levels"]["3"] == true:
		$levels/Button4.disabled = false
	else:
		$levels/Button4.disabled = true
	if save["games"]["1"]["levels"]["4"] == true:
		$levels/Button5.disabled = false
	else:
		$levels/Button5.disabled = true


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://ressources/scenes/1/messages/1.tscn")

func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://ressources/scenes/1/messages/2.tscn")

func _on_button_3_pressed() -> void:
	get_tree().change_scene_to_file("res://ressources/scenes/1/messages/3.tscn")

func _on_button_4_pressed() -> void:
	get_tree().change_scene_to_file("res://ressources/scenes/1/messages/4.tscn")

func _on_button_5_pressed() -> void:
	get_tree().change_scene_to_file("res://ressources/scenes/1/messages/5.tscn")

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://ressources/scenes/1/menu.tscn")
