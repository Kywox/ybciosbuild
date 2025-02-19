extends CharacterBody2D

@onready var anim = $AnimatedSprite2D
var speed = 10000
var input_vector_x = 0
var input_vector_y = 0
var can_input : bool = true
var plrx = 0
var plry = 0
var area_disabled = false

func _ready() -> void:
	anim.play("idle")

func _physics_process(delta: float) -> void:
	if can_input == true:
		input_vector_x = Input.get_action_strength("1-right") - Input.get_action_strength("1-left")
		input_vector_y = Input.get_action_strength("1-down") - Input.get_action_strength("1-up")
		if input_vector_y == 0:
			if input_vector_x < 0:
				anim.play("left")
				plrx = -1
				plry = 0
				self.velocity = Vector2(plrx, plry)*delta*speed
			if input_vector_x > 0:
				anim.play("right")
				plrx = 1
				plry = 0
				self.velocity = Vector2(plrx, plry)*delta*speed
			if input_vector_x == 0:
				anim.play("idle")
				plrx = 0
				plry = 0
				self.velocity = Vector2(plrx, plry)*delta*speed
		elif input_vector_y > 0:
			if input_vector_x < 0:
				anim.play("down-left")
				plrx = -1
				plry = 1
				self.velocity = Vector2(plrx, plry)*delta*speed
			if input_vector_x > 0:
				anim.play("down-right")
				plrx = 1
				plry = 1
				self.velocity = Vector2(plrx, plry)*delta*speed
			if input_vector_x == 0:
				anim.play("down")
				plrx = 0
				plry = 1
				self.velocity = Vector2(plrx, plry)*delta*speed
		elif input_vector_y < 0:
			if input_vector_x < 0:
				anim.play("up-left")
				plrx = -1
				plry = -1
				self.velocity = Vector2(plrx, plry)*delta*speed
			if input_vector_x > 0:
				anim.play("up-right")
				plrx = 1
				plry = -1
				self.velocity = Vector2(plrx, plry)*delta*speed
			if input_vector_x == 0:
				anim.play("up")
				plrx = 0
				plry = -1
				self.velocity = Vector2(plrx, plry)*delta*speed
	else:
		plrx = 0
		plry = 0
		self.velocity = Vector2(plrx, plry)*delta*speed
	move_and_slide()

func death():
	area_disabled = true
	can_input = false
	$AnimationPlayer.play("death")
	$AnimatedSprite2D.play("death")
	$ded.play()
	$dedtimer.start()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area_disabled == false:
		if area.is_in_group("hostile"):
			death()
		if area.is_in_group("finish"):
			if self.name == "1":
				get_tree().change_scene_to_file("res://ressources/scenes/1/messages/2.tscn")
			if self.name == "2":
				get_tree().change_scene_to_file("res://ressources/scenes/1/messages/3.tscn")
			if self.name == "3":
				get_tree().change_scene_to_file("res://ressources/scenes/1/messages/4.tscn")
			if self.name == "4":
				get_tree().change_scene_to_file("res://ressources/scenes/1/messages/5.tscn")
			if self.name == "5":
				get_tree().change_scene_to_file("res://ressources/scenes/1/messages/win.tscn")

func _on_dedtimer_timeout() -> void:
	var spawn_pos = $".."/spawn.position
	self.position = spawn_pos
	area_disabled = false
	can_input = true
	$AnimatedSprite2D.play("idle")
	$AnimationPlayer.play("RESET")

func _on_home_pressed() -> void:
	can_input = false
	$"../.."/pause.visible = true
	$"../.."/hud.visible = false

func _on_resume_pressed() -> void:
	can_input = true
	$"../.."/pause.visible = false
	$"../.."/hud.visible = true

func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://ressources/scenes/1/menu.tscn")

func _on_selectlvl_pressed() -> void:
	get_tree().change_scene_to_file("res://ressources/scenes/1/selectlvl.tscn")


func _on_right_pressed() -> void:
	death()
