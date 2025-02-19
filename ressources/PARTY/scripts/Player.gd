extends CharacterBody3D

var speed
const WALK_SPEED = 5.0
const SPRINT_SPEED = 8.0
const JUMP_VELOCITY = 6
const SENSITIVITY = 0.004

#bob variables
const BOB_FREQ = 2.4
const BOB_AMP = 0.08
var t_bob = 0.0

#fov variables
const BASE_FOV = 100.0
const FOV_CHANGE = 1.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 16
var stamina = 100
var maxstamina = 100
var sprinton = true

@onready var head = $Head
@onready var camera = $Head/Camera3D

var can_input = true


func _unhandled_input(event):
	if can_input == true:
		if event is InputEventMouseMotion:
			head.rotate_y(-event.relative.x * SENSITIVITY)
			camera.rotate_x(-event.relative.y * SENSITIVITY)
			camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-80), deg_to_rad(80))

func _physics_process(delta):
	if stamina >= 80:
		$".."/HUD/Stamina.add_theme_color_override("font_color", Color(0.568, 1, 0.34))
	else:
		if stamina >= 60:
			$".."/HUD/Stamina.add_theme_color_override("font_color", Color(0.854, 0.933, 0))
		else:
			if stamina >= 40:
				$".."/HUD/Stamina.add_theme_color_override("font_color", Color(1, 0.861, 0.455))
			else:
				if stamina >= 20:
					$".."/HUD/Stamina.add_theme_color_override("font_color", Color(1, 0.749, 0.481))
				else:
					if stamina > 0:
						$".."/HUD/Stamina.add_theme_color_override("font_color", Color(1, 0.606, 0.559))
					elif stamina == 0:
						$".."/HUD/Stamina.add_theme_color_override("font_color", Color(0.866, 0, 0.166))
	
	if $can_input.text == "false":
		can_input = false
		velocity.x = 0
		velocity.z = 0
	else:
		can_input = true
	
	if stamina >= maxstamina:
		stamina = 100
	if stamina <= 0:
		sprinton = false
		speed = WALK_SPEED
		stamina = 0
	else:
		sprinton = true
	$".."/HUD/Stamina.text = str(stamina) + "%"
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
	# Handle Jump.
	if can_input == true:
		if Input.is_action_just_pressed("3D_jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY
		
		# Handle Sprint.
		if Input.is_action_pressed("3D_sprint"):
			if sprinton == true and stamina >= 1:
				speed = SPRINT_SPEED
		else:
			speed = WALK_SPEED

		# Get the input direction and handle the movement/deceleration.
		var input_dir = Input.get_vector("3D_left", "3D_right", "3D_foward", "3D_backward")
		var direction = (head.transform.basis * transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		if is_on_floor():
			if direction:
				velocity.x = direction.x * speed
				velocity.z = direction.z * speed
			else:
				velocity.x = lerp(velocity.x, direction.x * speed, delta * 7.0)
				velocity.z = lerp(velocity.z, direction.z * speed, delta * 7.0)
		else:
			velocity.x = lerp(velocity.x, direction.x * speed, delta * 3.0)
			velocity.z = lerp(velocity.z, direction.z * speed, delta * 3.0)
	
	# Head bob
	t_bob += delta * velocity.length() * float(is_on_floor())
	camera.transform.origin = _headbob(t_bob)
	
	# FOV
	var velocity_clamped = clamp(velocity.length(), 0.5, SPRINT_SPEED * 2)
	var target_fov = BASE_FOV + FOV_CHANGE * velocity_clamped
	camera.fov = lerp(camera.fov, target_fov, delta * 8.0)
	
	move_and_slide()

func _headbob(time) -> Vector3:
	var pos = Vector3.ZERO
	pos.y = sin(time * BOB_FREQ) * BOB_AMP
	pos.x = cos(time * BOB_FREQ / 2) * BOB_AMP
	return pos

func _on_stamina_recovery_timeout() -> void:
	if Input.is_action_pressed("3D_sprint"):
		stamina = stamina - 1
	else:
		if Input.is_action_pressed("3D_left") or Input.is_action_pressed("3D_right") or Input.is_action_pressed("3D_backward") or Input.is_action_pressed("3D_foward"): 
			stamina = stamina + 0
		else:
			stamina = stamina + 1
