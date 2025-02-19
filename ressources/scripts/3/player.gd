extends CharacterBody2D

@onready var anim = $AnimatedSprite2D
var speed = 10000
var input_vector_x = 0
var input_vector_y = 0
var can_input : bool = true
var plrx = 0
var plry = 0
var area_disabled = false
var gravity = 1350
var jumpvelo = -400

func _ready() -> void:
	var save = SD.read_save()
	if save["games"]["3"]["star"] == true:
		$".."/star.visible = false
		$".."/star/Area2D/CollisionShape2D.disabled = true
	else:
		$".."/star.visible = true
		$".."/star/Area2D/CollisionShape2D.disabled = false
	
	if save["keys"]["3"] == true or save["keys"]["fg"] == false:
		$".."/key.position.y = -5000

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	if can_input == true:
		input_vector_x = Input.get_action_strength("1-right") - Input.get_action_strength("1-left")
		if Input.is_action_just_pressed("3-jump") and is_on_floor():
			velocity.y = jumpvelo
		if input_vector_x == 0:
			plrx = 0
			self.velocity.x = plrx*delta*speed
		if input_vector_x == 1:
			plrx = 1
			self.velocity.x = plrx*delta*speed
		if input_vector_x == -1:
			plrx = -1
			self.velocity.x = plrx*delta*speed
	else:
		plrx = 0
		self.velocity.x = plrx*delta*speed
	move_and_slide()

func win():
	var save = SD.read_save()
	save["games"]["3"]["star"] = true
	SD.write_save(save)
	get_tree().change_scene_to_file("res://ressources/scenes/3/win.tscn")

func key():
	var save = SD.read_save()
	save["keys"]["3"] = true
	SD.write_save(save)
	get_tree().change_scene_to_file("res://ressources/scenes/3/key.tscn")

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("win"):
		win()
	if area.is_in_group("key"):
		key()
	if area.is_in_group("soda"):
		get_tree().change_scene_to_file("res://ressources/scenes/3/menu.tscn")

func _on_home_pressed() -> void:
	can_input = false
	$"../.."/pause.visible = true
	$"../.."/hud.visible = false

func _on_resume_pressed() -> void:
	can_input = true
	$"../.."/pause.visible = false
	$"../.."/hud.visible = true

func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://ressources/scenes/menu.tscn")
