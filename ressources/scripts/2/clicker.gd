extends Node

var coins = 0

func _ready() -> void:
	var save = SD.read_save()
	coins = save["games"]["2"]["coins"]
	$HUD/ColorRect/AnimationPlayer.play("color")
	$HUD/Cubebgthing/AnimationPlayer.play("new_animation")

func _process(delta: float) -> void:
	$HUD/coins.text = str(coins)
	var save = SD.read_save()
	
	if coins >= 150000:
		if save["keys"]["2"] == false and save["keys"]["fg"] == true:
			$HUD/gamekey.visible = true
	
	if save["games"]["2"]["upgrades"]["yaxoul"] == 0:
		$HUD/Yaxoul.visible = true
		$HUD/SilverYaxoul.visible = false
		$HUD/RubyYaxoul.visible = false
		$HUD/GoldYaxoul.visible = false
		$HUD/EmeraldYaxoul.visible = false
		$HUD/DiamondYaxoul.visible = false
		$HUD/yaxoul.text = "Yaxoul's form = Normal
NExt : $500 for Silver"
	if save["games"]["2"]["upgrades"]["yaxoul"] == 1:
		$HUD/Yaxoul.visible = false
		$HUD/SilverYaxoul.visible = true
		$HUD/RubyYaxoul.visible = false
		$HUD/GoldYaxoul.visible = false
		$HUD/EmeraldYaxoul.visible = false
		$HUD/DiamondYaxoul.visible = false
		$HUD/yaxoul.text = "Yaxoul's form = Silver
NExt : $1000 for Gold"
	if save["games"]["2"]["upgrades"]["yaxoul"] == 2:
		$HUD/Yaxoul.visible = false
		$HUD/SilverYaxoul.visible = false
		$HUD/RubyYaxoul.visible = false
		$HUD/GoldYaxoul.visible = true
		$HUD/EmeraldYaxoul.visible = false
		$HUD/DiamondYaxoul.visible = false
		$HUD/yaxoul.text = "Yaxoul's form = Gold
NExt : $5000 for Diamond"
	if save["games"]["2"]["upgrades"]["yaxoul"] == 3:
		$HUD/Yaxoul.visible = false
		$HUD/SilverYaxoul.visible = false
		$HUD/RubyYaxoul.visible = false
		$HUD/GoldYaxoul.visible = false
		$HUD/EmeraldYaxoul.visible = false
		$HUD/DiamondYaxoul.visible = true
		$HUD/yaxoul.text = "Yaxoul's form = Diamond
NExt : $10000 for Emerald"
	if save["games"]["2"]["upgrades"]["yaxoul"] == 4:
		$HUD/Yaxoul.visible = false
		$HUD/SilverYaxoul.visible = false
		$HUD/RubyYaxoul.visible = false
		$HUD/GoldYaxoul.visible = false
		$HUD/EmeraldYaxoul.visible = true
		$HUD/DiamondYaxoul.visible = false
		$HUD/yaxoul.text = "Yaxoul's form = Emerald
NExt : $20000 for Ruby"
	if save["games"]["2"]["upgrades"]["yaxoul"] == 5:
		$HUD/Yaxoul.visible = false
		$HUD/SilverYaxoul.visible = false
		$HUD/RubyYaxoul.visible = true
		$HUD/GoldYaxoul.visible = false
		$HUD/EmeraldYaxoul.visible = false
		$HUD/DiamondYaxoul.visible = false
		$HUD/yaxoul.text = "Yaxoul's form = Ruby
MAX"
	
	if save["games"]["2"]["upgrades"]["autoclicker"]["speed"] == 5:
		$HUD/acspeed.text = "Autoclicker Speed = 5s
NExt : $200 for 4s"
	if save["games"]["2"]["upgrades"]["autoclicker"]["speed"] == 4:
		$HUD/acspeed.text = "Autoclicker Speed = 4s
NExt : $400 for 3s"
	if save["games"]["2"]["upgrades"]["autoclicker"]["speed"] == 3:
		$HUD/acspeed.text = "Autoclicker Speed = 3s
NExt : $600 for 2s"
	if save["games"]["2"]["upgrades"]["autoclicker"]["speed"] == 2:
		$HUD/acspeed.text = "Autoclicker Speed = 2s
NExt : $800 for 1s"
	if save["games"]["2"]["upgrades"]["autoclicker"]["speed"] == 1:
		$HUD/acspeed.text = "Autoclicker Speed = 1s
NExt : $1000 for 0.5s"
	if save["games"]["2"]["upgrades"]["autoclicker"]["speed"] == 0.5:
		$HUD/acspeed.text = "Autoclicker Speed = 0.5s
NExt : $1500 for 0.1s"
	if save["games"]["2"]["upgrades"]["autoclicker"]["speed"] == 0.1:
		$HUD/acspeed.text = "Autoclicker Speed = 0.1s
MAX"
	
	if save["games"]["2"]["upgrades"]["autoclicker"]["give"] == 0:
		$HUD/acgive.text = "Autoclicker Give = 0
NExt : $100 for 1"
	if save["games"]["2"]["upgrades"]["autoclicker"]["give"] == 1:
		$HUD/acgive.text = "Autoclicker Give = 1
NExt : $200 for 5"
	if save["games"]["2"]["upgrades"]["autoclicker"]["give"] == 5:
		$HUD/acgive.text = "Autoclicker Give = 5
NExt : $300 for 10"
	if save["games"]["2"]["upgrades"]["autoclicker"]["give"] == 10:
		$HUD/acgive.text = "Autoclicker Give = 10
NExt : $400 for 15"
	if save["games"]["2"]["upgrades"]["autoclicker"]["give"] == 15:
		$HUD/acgive.text = "Autoclicker Give = 15
NExt : $500 for 20"
	if save["games"]["2"]["upgrades"]["autoclicker"]["give"] == 20:
		$HUD/acgive.text = "Autoclicker Give = 20
NExt : $600 for 25"
	if save["games"]["2"]["upgrades"]["autoclicker"]["give"] == 25:
		$HUD/acgive.text = "Autoclicker Give = 25
NExt : $700 for 30"
	if save["games"]["2"]["upgrades"]["autoclicker"]["give"] == 30:
		$HUD/acgive.text = "Autoclicker Give = 30
NExt : $800 for 35"
	if save["games"]["2"]["upgrades"]["autoclicker"]["give"] == 35:
		$HUD/acgive.text = "Autoclicker Give = 35
NExt : $900 for 40"
	if save["games"]["2"]["upgrades"]["autoclicker"]["give"] == 40:
		$HUD/acgive.text = "Autoclicker Give = 40
NExt : $1000 for 50"
	if save["games"]["2"]["upgrades"]["autoclicker"]["give"] == 50:
		$HUD/acgive.text = "Autoclicker Give = 50
MAX"
	if save["games"]["2"]["star"] == false:
		if save["games"]["2"]["upgrades"]["autoclicker"]["give"] == 50:
			if save["games"]["2"]["upgrades"]["autoclicker"]["speed"] == 0.1:
				if save["games"]["2"]["upgrades"]["yaxoul"] == 5:
					$HUD/star.visible = true
				else:
					$HUD/star.visible = false
			else:
				$HUD/star.visible = false
		else:
			$HUD/star.visible = false
	else:
		$HUD/star.visible = false

func _on_yaxoul_pressed() -> void:
	var save = SD.read_save()
	if save["games"]["2"]["upgrades"]["yaxoul"] == 0:
		coins = coins + 1 
	if save["games"]["2"]["upgrades"]["yaxoul"] == 1:
		coins = coins + 15
	if save["games"]["2"]["upgrades"]["yaxoul"] == 2:
		coins = coins + 35
	if save["games"]["2"]["upgrades"]["yaxoul"] == 3:
		coins = coins + 50
	if save["games"]["2"]["upgrades"]["yaxoul"] == 4:
		coins = coins + 100
	if save["games"]["2"]["upgrades"]["yaxoul"] == 5:
		coins = coins + 500
	$Clickyaxoul.play()

func _on_home_pressed() -> void:
	var save = SD.read_save()
	save["games"]["2"]["coins"] = coins
	SD.write_save(save)
	get_tree().change_scene_to_file("res://ressources/scenes/menu.tscn")

func _on_autoclickertime_timeout() -> void:
	var save = SD.read_save()
	coins = coins + save["games"]["2"]["upgrades"]["autoclicker"]["give"]
	$HUD/autoclickertime.start(save["games"]["2"]["upgrades"]["autoclicker"]["speed"])

func _on_upg_yaxoul_pressed() -> void:
	var save = SD.read_save()
	if save["games"]["2"]["upgrades"]["yaxoul"] == 0:
		if coins >= 500:
			coins = coins - 500
			save["games"]["2"]["coins"] = coins
			save["games"]["2"]["upgrades"]["yaxoul"] = 1
			SD.write_save(save)
			$Cash.play()
	if save["games"]["2"]["upgrades"]["yaxoul"] == 1:
		if coins >= 1000:
			coins = coins - 1000
			save["games"]["2"]["coins"] = coins
			save["games"]["2"]["upgrades"]["yaxoul"] = 2
			SD.write_save(save)
			$Cash.play()
	if save["games"]["2"]["upgrades"]["yaxoul"] == 2:
		if coins >= 5000:
			coins = coins - 5000
			save["games"]["2"]["coins"] = coins
			save["games"]["2"]["upgrades"]["yaxoul"] = 3
			SD.write_save(save)
			$Cash.play()
	if save["games"]["2"]["upgrades"]["yaxoul"] == 3:
		if coins >= 10000:
			coins = coins - 10000
			save["games"]["2"]["coins"] = coins
			save["games"]["2"]["upgrades"]["yaxoul"] = 4
			SD.write_save(save)
			$Cash.play()
	if save["games"]["2"]["upgrades"]["yaxoul"] == 4:
		if coins >= 20000:
			coins = coins - 20000
			save["games"]["2"]["coins"] = coins
			save["games"]["2"]["upgrades"]["yaxoul"] = 5
			SD.write_save(save)
			$Cash.play()

func _on_upg_acgive_pressed() -> void:
	var save = SD.read_save()
	if save["games"]["2"]["upgrades"]["autoclicker"]["give"] == 0:
		if coins >= 100:
			coins = coins - 100
			save["games"]["2"]["coins"] = coins
			save["games"]["2"]["upgrades"]["autoclicker"]["give"] = 1
			SD.write_save(save)
			$Cash.play()
	if save["games"]["2"]["upgrades"]["autoclicker"]["give"] == 1:
		if coins >= 200:
			coins = coins - 200
			save["games"]["2"]["coins"] = coins
			save["games"]["2"]["upgrades"]["autoclicker"]["give"] = 5
			SD.write_save(save)
			$Cash.play()
	if save["games"]["2"]["upgrades"]["autoclicker"]["give"] == 5:
		if coins >= 300:
			coins = coins - 300
			save["games"]["2"]["coins"] = coins
			save["games"]["2"]["upgrades"]["autoclicker"]["give"] = 10
			SD.write_save(save)
			$Cash.play()
	if save["games"]["2"]["upgrades"]["autoclicker"]["give"] == 10:
		if coins >= 400:
			coins = coins - 400
			save["games"]["2"]["coins"] = coins
			save["games"]["2"]["upgrades"]["autoclicker"]["give"] = 15
			SD.write_save(save)
			$Cash.play()
	if save["games"]["2"]["upgrades"]["autoclicker"]["give"] == 15:
		if coins >= 500:
			coins = coins - 500
			save["games"]["2"]["coins"] = coins
			save["games"]["2"]["upgrades"]["autoclicker"]["give"] = 20
			SD.write_save(save)
			$Cash.play()
	if save["games"]["2"]["upgrades"]["autoclicker"]["give"] == 20:
		if coins >= 600:
			coins = coins - 600
			save["games"]["2"]["coins"] = coins
			save["games"]["2"]["upgrades"]["autoclicker"]["give"] = 25
			SD.write_save(save)
			$Cash.play()
	if save["games"]["2"]["upgrades"]["autoclicker"]["give"] == 25:
		if coins >= 700:
			coins = coins - 700
			save["games"]["2"]["coins"] = coins
			save["games"]["2"]["upgrades"]["autoclicker"]["give"] = 30
			SD.write_save(save)
			$Cash.play()
	if save["games"]["2"]["upgrades"]["autoclicker"]["give"] == 30:
		if coins >= 800:
			coins = coins - 800
			save["games"]["2"]["coins"] = coins
			save["games"]["2"]["upgrades"]["autoclicker"]["give"] = 35
			SD.write_save(save)
			$Cash.play()
	if save["games"]["2"]["upgrades"]["autoclicker"]["give"] == 35:
		if coins >= 900:
			coins = coins - 900
			save["games"]["2"]["coins"] = coins
			save["games"]["2"]["upgrades"]["autoclicker"]["give"] = 40
			SD.write_save(save)
			$Cash.play()
	if save["games"]["2"]["upgrades"]["autoclicker"]["give"] == 40:
		if coins >= 1000:
			coins = coins - 1000
			save["games"]["2"]["coins"] = coins
			save["games"]["2"]["upgrades"]["autoclicker"]["give"] = 50
			SD.write_save(save)
			$Cash.play()

func _on_upg_acspeed_pressed() -> void:
	var save = SD.read_save()
	if save["games"]["2"]["upgrades"]["autoclicker"]["speed"] == 5:
		if coins >= 200:
			coins = coins - 200
			save["games"]["2"]["coins"] = coins
			save["games"]["2"]["upgrades"]["autoclicker"]["speed"] = 4
			SD.write_save(save)
			$Cash.play()
	if save["games"]["2"]["upgrades"]["autoclicker"]["speed"] == 4:
		if coins >= 400:
			coins = coins - 400
			save["games"]["2"]["coins"] = coins
			save["games"]["2"]["upgrades"]["autoclicker"]["speed"] = 3
			SD.write_save(save)
			$Cash.play()
	if save["games"]["2"]["upgrades"]["autoclicker"]["speed"] == 3:
		if coins >= 600:
			coins = coins - 600
			save["games"]["2"]["coins"] = coins
			save["games"]["2"]["upgrades"]["autoclicker"]["speed"] = 2
			SD.write_save(save)
			$Cash.play()
	if save["games"]["2"]["upgrades"]["autoclicker"]["speed"] == 2:
		if coins >= 800:
			coins = coins - 800
			save["games"]["2"]["coins"] = coins
			save["games"]["2"]["upgrades"]["autoclicker"]["speed"] = 1
			SD.write_save(save)
			$Cash.play()
	if save["games"]["2"]["upgrades"]["autoclicker"]["speed"] == 1:
		if coins >= 1000:
			coins = coins - 1000
			save["games"]["2"]["coins"] = coins
			save["games"]["2"]["upgrades"]["autoclicker"]["speed"] = 0.5
			SD.write_save(save)
			$Cash.play()
	if save["games"]["2"]["upgrades"]["autoclicker"]["speed"] == 0.5:
		if coins >= 1500:
			coins = coins - 1500
			save["games"]["2"]["coins"] = coins
			save["games"]["2"]["upgrades"]["autoclicker"]["speed"] = 0.1
			SD.write_save(save)
			$Cash.play()

func _on_buystar_pressed() -> void:
	var save = SD.read_save()
	if save["games"]["2"]["star"] == false:
		if coins >= 50000:
			coins = coins - 50000
			save["games"]["2"]["coins"] = coins
			save["games"]["2"]["star"] = true
			SD.write_save(save)
			$Starbought.play()

func _on_gamekey_pressed() -> void:
	var save = SD.read_save()
	save["keys"]["2"] = true
	SD.write_save(save)
	$HUD/gamekey.visible = false
