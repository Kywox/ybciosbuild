extends StaticBody2D

@onready var bubblename = self.name

func _ready() -> void:
	$anim.play(bubblename)
