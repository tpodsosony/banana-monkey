extends Node2D

@export var mute: bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func play_grunt():
	$"Monkey Hit".play()

func play_throw():
	$"Monkey Throw".play()
	
func play_banana():
	$"Banana Hit".play()
	
func play_throw_p2():
	$"Monkey Throw P2".play()
