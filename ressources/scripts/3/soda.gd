extends CharacterBody2D

func _on_timer_timeout() -> void:
	self.position.y = position.y - 2.5
	$Timer.start()
