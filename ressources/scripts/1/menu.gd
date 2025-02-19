extends Node

func _on_exit_pressed() -> void:
	onemusic.stop_music()
	get_tree().change_scene_to_file("res://ressources/scenes/menu.tscn")

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://ressources/scenes/1/selectlvl.tscn")
