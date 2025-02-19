extends Node3D

var hitbox001 = false

var caninteract = true
var dialogueID = 0

var fluffyinteract = false
var walminginteract = false
var kowyinteract = false

var kowytalked = false
var fluffytalked = false
var walmingtalked = false
var bkcoming = false

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if fluffytalked == true and kowytalked == true and walmingtalked == true and bkcoming == false:
		$Map/bkevent.start()
		$HUD/objective.visible = true
		$HUD/objective/Objective.text = "Relax"
		bkcoming = true
	
	# interact
	if caninteract == true:
		if kowyinteract == true:
			$HUD/interact.visible = true
			if Input.is_action_pressed("interact"):
				if dialogueID == 0:
					$Dialogue/Next.visible = false
					$Dialogue/interactcooldown.start()
					$Player/can_input.text = "false"
					caninteract = false
					$Dialogue/who.text = "Kowy"
					$Dialogue/text.text = "Happy Birthdey Yaxoooouuuul!!!"
					$HUD.visible = false
					$Dialogue.visible = true
					dialogueID = 1
				elif dialogueID == 1:
					$Dialogue/Next.visible = false
					$Dialogue/interactcooldown.start()
					$Player/can_input.text = "false"
					caninteract = false
					$Dialogue/who.text = "Kowy"
					$Dialogue/text.text = "J'suis tellement exité pouur le GATOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO"
					$HUD.visible = false
					$Dialogue.visible = true
					dialogueID = 2
				elif dialogueID == 2:
					$Dialogue/Next.visible = false
					$Dialogue/interactcooldown.start()
					$Player/can_input.text = "false"
					caninteract = false
					$Dialogue/who.text = "Kowy"
					$Dialogue/text.text = "J'suis Tellement Exité QUE JE POURRAIS-"
					$HUD.visible = false
					$Dialogue.visible = true
					dialogueID = 3
				elif dialogueID == 3:
					$Dialogue/Next.visible = false
					$Dialogue/interactcooldown.start()
					$Player/can_input.text = "false"
					caninteract = false
					$Dialogue/who.text = "Kowy"
					$Dialogue/text.text = "J'aaaaai la flemme de coder sa..."
					$HUD.visible = false
					$Dialogue.visible = true
					dialogueID = 4
				elif dialogueID == 4:
					$Dialogue/Next.visible = false
					$Player/can_input.text = "true"
					caninteract = true
					$HUD.visible = true
					$Dialogue.visible = false
					dialogueID = 0
					kowytalked = true
					$Map/Kowy/Area3D/CollisionShape3D2.disabled = true
		elif fluffyinteract == true:
			$HUD/interact.visible = true
			if Input.is_action_pressed("interact"):
				if dialogueID == 0:
					$Dialogue/Next.visible = false
					$Dialogue/interactcooldown.start()
					$Player/can_input.text = "false"
					caninteract = false
					$Dialogue/who.text = "Fluffy"
					$Dialogue/text.text = "Joyeux anniversaire Copaaaiiinn!"
					$HUD.visible = false
					$Dialogue.visible = true
					dialogueID = 1
				elif dialogueID == 1:
					$Dialogue/Next.visible = false
					$Dialogue/interactcooldown.start()
					$Player/can_input.text = "false"
					caninteract = false
					$Dialogue/who.text = "Fluffy"
					$Dialogue/text.text = "J'espère tu va aimer mon cadeau!"
					$HUD.visible = false
					$Dialogue.visible = true
					dialogueID = 2
				elif dialogueID == 2:
					$Dialogue/Next.visible = false
					$Dialogue/interactcooldown.start()
					$Player/can_input.text = "false"
					caninteract = false
					$Dialogue/who.text = "Fluffy"
					$Dialogue/text.text = "J'ai fait le gâteau d'ailleur!"
					$HUD.visible = false
					$Dialogue.visible = true
					dialogueID = 3
				elif dialogueID == 3:
					$Dialogue/Next.visible = false
					$Dialogue/interactcooldown.start()
					$Player/can_input.text = "false"
					caninteract = false
					$Dialogue/who.text = "Fluffy"
					$Dialogue/text.text = "Je suis encore tombé sur des choses cheulous aussi..."
					$HUD.visible = false
					$Dialogue.visible = true
					dialogueID = 4
				elif dialogueID == 4:
					$Dialogue/Next.visible = false
					$Dialogue/interactcooldown.start()
					$Player/can_input.text = "false"
					caninteract = false
					$Dialogue/who.text = "Fluffy"
					$Dialogue/text.text = "Bref! Bonne anniversaire!"
					$HUD.visible = false
					$Dialogue.visible = true
					dialogueID = 5
				elif dialogueID == 5:
					$Dialogue/Next.visible = false
					$Player/can_input.text = "true"
					caninteract = true
					$HUD.visible = true
					$Dialogue.visible = false
					dialogueID = 0
					fluffytalked = true
					$Map/Fluffy/Area3D/CollisionShape3D.disabled = true
		elif walminginteract == true:
			$HUD/interact.visible = true
			if Input.is_action_pressed("interact"):
				if dialogueID == 0:
					$Dialogue/Next.visible = false
					$Dialogue/interactcooldown.start()
					$Player/can_input.text = "false"
					caninteract = false
					$Dialogue/who.text = "Walming"
					$Dialogue/text.text = "Bonne anniversaire Fidoche!"
					$HUD.visible = false
					$Dialogue.visible = true
					dialogueID = 1
				elif dialogueID == 1:
					$Dialogue/Next.visible = false
					$Dialogue/interactcooldown.start()
					$Player/can_input.text = "false"
					caninteract = false
					$Dialogue/who.text = "Walming"
					$Dialogue/text.text = "D'ailleurs, tu savais que Kowy a pris 58 minutes juste pour faire le systeme des dialogues?"
					$HUD.visible = false
					$Dialogue.visible = true
					dialogueID = 2
				elif dialogueID == 2:
					$Dialogue/Next.visible = false
					$Dialogue/interactcooldown.start()
					$Player/can_input.text = "false"
					caninteract = false
					$Dialogue/who.text = "Walming"
					$Dialogue/text.text = "attends... 58?!"
					$HUD.visible = false
					$Dialogue.visible = true
					dialogueID = 3
				elif dialogueID == 3:
					$Dialogue/Next.visible = false
					$Dialogue/interactcooldown.start()
					$Player/can_input.text = "false"
					caninteract = false
					$Dialogue/who.text = "Walming"
					$Dialogue/text.visible = false
					$Dialogue/BZ58.visible = true
					$HUD.visible = false
					$Dialogue.visible = true
					dialogueID = 4
				elif dialogueID == 4:
					$Dialogue/Next.visible = false
					$Player/can_input.text = "true"
					$Dialogue/text.visible = true
					$Dialogue/BZ58.visible = false
					caninteract = true
					$HUD.visible = true
					$Dialogue.visible = false
					dialogueID = 0
					walmingtalked = true
					$Map/Walming/Area3D/CollisionShape3D2.disabled = true
		else:
			$HUD/interact.visible = false

func player_touched_area(area: Area3D) -> void:
	if area.is_in_group("hitbox001"):
		if hitbox001 == false:
			hitbox001 = true
			$AnimationPlayer.play("HAPPYBIRTHDAY!")
	if area.is_in_group("interact001"):
		kowyinteract = true
	if area.is_in_group("interact002"):
		fluffyinteract = true
	if area.is_in_group("interact003"):
		walminginteract = true

func player_exited_area(area: Area3D) -> void:
	if area.is_in_group("interact001"):
		kowyinteract = false
	if area.is_in_group("interact002"):
		fluffyinteract = false
	if area.is_in_group("interact003"):
		walminginteract = false

func start_music():
	$music.play()
	$HUD/objective.visible = true
	$HUD/objective/Objective.text = "Parle à tout le monde!"
	$Map/Kowy/Area3D/CollisionShape3D2.disabled = false
	$Map/Fluffy/Area3D/CollisionShape3D.disabled = false
	$Map/Walming/Area3D/CollisionShape3D2.disabled = false
	$Map/wallinvisible/CollisionShape3D.disabled = false

func _on_interactcooldown_timeout() -> void:
	$Dialogue/Next.visible = true
	caninteract = true

func _on_bkevent_timeout() -> void:
	$Map/Walming.play("bkarrive")
	$Map/Kowy.play("bkarrive")
	$Map/Fluffy.play("bkarrive")
	$Map/BOYKISSER.visible = true
	$AnimationPlayer.play("Boykisser")
	$HUD/objective.visible = false
	$Map/BOYKISSER/door.play()
	$music.stop()
	$Map/BOYKISSER/peniseek.play()
	$Map/bkevent2.start()
	var save = SD.read_save()
	save["games"]["party"]["played"] = true
	SD.write_save(save)

func _on_bkevent_2_timeout() -> void:
	get_tree().quit()
