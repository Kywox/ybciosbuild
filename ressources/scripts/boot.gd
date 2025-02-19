extends Control

@onready var save = SD.read_save()
@onready var saveshit = save["games"]["party"]["played"]

func _ready() -> void:
	if save["keys"]["kd"] == false and save["keys"]["1"] == true and save["keys"]["2"] == true and save["keys"]["3"] == true and save["keys"]["4"] == true:
		get_tree().change_scene_to_file("res://ressources/PARTY/scenes/keydialogue.tscn")
	$anim.play("anim")

func _process(delta: float) -> void:
	if Input.get_action_strength("skipboot") > 0:
		launch()

func launch():
	if saveshit == true:
		get_tree().change_scene_to_file("res://ressources/PARTY/scenes/basement.tscn")
	else:
		get_tree().change_scene_to_file("res://ressources/scenes/menu.tscn")

func _on_anim_animation_finished(anim_name: StringName) -> void:
	launch()
