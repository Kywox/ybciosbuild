extends Node

var music = load("res://ressources/sounds/bgm/1.mp3")

func _ready() -> void:
	pass

func play_music():
	$music.stream = music
	$music.play()

func stop_music():
	$music.stream = music
	$music.stop()
