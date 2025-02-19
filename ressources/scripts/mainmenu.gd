extends Node

var game : int = 0
var fuckmusics = false

func _ready() -> void:
	var save = SD.read_save()
	save["games"]["party"]["played"] = false
	SD.write_save(save)
	Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)
	if save["games"]["1"]["star"] == true and save["games"]["2"]["star"] == true and save["games"]["3"]["star"] == true and save["games"]["party"]["star"] == true:
		$menuaudio.volume_db = -80
		$"menu+audio".volume_db = 0
		fuckmusics = true
	$menu.visible = true
	$selectgame.visible = false
	$more.visible = false
	$credits.visible = false
	$stats.visible = false

func _process(delta: float) -> void:
	if fuckmusics == true:
		$menuaudio.stop()
		$moreaudio.stop()
		$"more+audio".stop()
	
	if game == 0:
		var save = SD.read_save()
		if save["games"]["1"]["star"] == true:
			$selectgame/star.visible = true
		else:
			$selectgame/star.visible = false
		$selectgame/game.play("1")
		$selectgame/ColorRect.color = Color(0, 0.365, 0.384)
		$selectgame/ColorRect2.color = Color(0, 0.53, 0.567)
		$selectgame/name.text = "Hardest Yaxoul"
		$selectgame/description.text = "Évite les balles bleue qui te court dessus ! Sinon tu meurt."
		$menuaudio.pitch_scale = 1
	if game == 1:
		var save = SD.read_save()
		if save["games"]["2"]["star"] == true:
			$selectgame/star.visible = true
		else:
			$selectgame/star.visible = false
		$selectgame/game.play("2")
		$selectgame/ColorRect.color = Color(0.611, 0.322, 0)
		$selectgame/ColorRect2.color = Color(0.832, 0.446, 0)
		$selectgame/name.text = "Yaxoul Clicker"
		$selectgame/description.text = "Appuie sur le Yaxoul pour gagné de la vrai Money !! OUII DE LA VRAI MOULAA !!!"
		$menuaudio.pitch_scale = 1
	if game == 2:
		var save = SD.read_save()
		if save["games"]["3"]["star"] == true:
			$selectgame/star.visible = true
		else:
			$selectgame/star.visible = false
		$selectgame/game.play("3")
		$selectgame/ColorRect.color = Color(0, 0.494, 0.201)
		$selectgame/ColorRect2.color = Color(0, 0.674, 0.315)
		$selectgame/name.text = "Jumping Yaxoul"
		$selectgame/description.text = "Un jeu de plateforme assez simple ! Tkt fidy j’ai fais le jeu facile XDD"
		$menuaudio.pitch_scale = 1
	if game == 3:
		var save = SD.read_save()
		if save["games"]["party"]["star"] == true:
			$selectgame/star.visible = true
		else:
			$selectgame/star.visible = false
		if save["games"]["1"]["star"] == true:
			if save["games"]["2"]["star"] == true:
				if save["games"]["3"]["star"] == true:
					$selectgame/star.visible = false
					$selectgame/game.play("party")
					$selectgame/ColorRect.color = Color(0.14, 0.14, 0.14)
					$selectgame/ColorRect2.color = Color(0.069, 0.069, 0.069)
					$selectgame/name.text = "Party"
					$selectgame/description.text = "Il n'y a pas de retour en arrière..."
					$menuaudio.pitch_scale = 0.6
				else:
					$selectgame/star.visible = false
					$selectgame/game.play("locked")
					$selectgame/ColorRect.color = Color(0.354, 0, 0.432)
					$selectgame/ColorRect2.color = Color(0.551, 0.001, 0.677)
					$selectgame/name.text = "Verrouiller..."
					$selectgame/description.text = "Fini les trois jeux pour le débloquer..."
					$menuaudio.pitch_scale = 1
			else:
				$selectgame/star.visible = false
				$selectgame/game.play("locked")
				$selectgame/ColorRect.color = Color(0.354, 0, 0.432)
				$selectgame/ColorRect2.color = Color(0.551, 0.001, 0.677)
				$selectgame/name.text = "Verrouiller..."
				$selectgame/description.text = "Fini les trois jeux pour le débloquer..."
				$menuaudio.pitch_scale = 1
		else:
			$selectgame/star.visible = false
			$selectgame/game.play("locked")
			$selectgame/ColorRect.color = Color(0.354, 0, 0.432)
			$selectgame/ColorRect2.color = Color(0.551, 0.001, 0.677)
			$selectgame/name.text = "Verrouiller..."
			$selectgame/description.text = "Fini les trois jeux pour le débloquer..."
			$menuaudio.pitch_scale = 1

# MENU
func _on_menu_start_pressed() -> void:
	$button.play()
	$menu.visible = false
	$selectgame.visible = true
	game = 0

func _on_menu_exit_pressed() -> void:
	$button.play()
	get_tree().quit()

func _on_menu_more_pressed() -> void:
	$button.play()
	$moreaudio.volume_db = 0
	$menuaudio.volume_db = -80
	$menu.visible = false
	$more.visible = true

# MORE
func _on_more_back_pressed() -> void:
	$button.play()
	$moreaudio.volume_db = -80
	$menuaudio.volume_db = 0
	$more.visible = false
	$menu.visible = true

func _on_more_credits_pressed() -> void:
	$button.play()
	$moreaudio.volume_db = -80
	$"more+audio".volume_db = 0
	$more.visible = false
	$credits.visible = true

func _on_more_stats_pressed() -> void:
	$button.play()
	$moreaudio.volume_db = -80
	$"more+audio".volume_db = 0
	$more.visible = false
	$stats.visible = true

# SELECTGAME
func _on_sg_back_pressed() -> void:
	$button.play()
	$selectgame.visible = false
	$menu.visible = true
	game = 0
	$menuaudio.pitch_scale = 1

func _on_sg_play_pressed() -> void:
	$button.play()
	if game == 0:
		onemusic.play_music()
		get_tree().change_scene_to_file("res://ressources/scenes/1/menu.tscn")
	if game == 1:
		get_tree().change_scene_to_file("res://ressources/scenes/2/clicker.tscn")
	if game == 2:
		get_tree().change_scene_to_file("res://ressources/scenes/3/menu.tscn")
	if game == 3:
		var save = SD.read_save()
		if save["games"]["1"]["star"] == true:
			if save["games"]["2"]["star"] == true:
				if save["games"]["3"]["star"] == true:
					get_tree().change_scene_to_file("res://ressources/PARTY/scenes/intro.tscn")
				else:
					print("locked")
			else:
				print("locked")
		else:
			print("locked")

func _on_sg_left_pressed() -> void:
	$button.play()
	game = game - 1
	if game == -1:
		game = 3

func _on_sg_right_pressed() -> void:
	$button.play()
	game = game + 1
	if game == 4:
		game = 0


func _on_back_tomore_pressed() -> void:
	$button.play()
	$moreaudio.volume_db = 0
	$"more+audio".volume_db = -80
	$stats.visible = false
	$credits.visible = false
	$more.visible = true


func _on_reset_pressed() -> void:
	var data = {
					"games": {
						"1": {
							"star": false,
							"levels": {
								"1": false,
								"2": false,
								"3": false,
								"4": false
							}
						},
						"2": {
							"star": false,
							"coins": 0,
							"upgrades": {
								"yaxoul": 0,
								"autoclicker": {
									"speed": 5,
									"give": 0
								}
							}
						},
						"3": {
							"star": false
						},
						"party": {
							"played": false,
							"deaths": 0,
							"lap3": false,
							"star": false
						}
					},
					"keys": {
						"kd": false,
						"fg": false,
						"1": false,
						"2": false,
						"3": false,
						"4": false
					},
					"ending": {
						"GENOCIDE": false,
						"PACIFIST": false,
						"IPAD": false
					}
				}
	SD.write_save(data)
	get_tree().change_scene_to_file("res://ressources/scenes/boot.tscn")
