extends Node2D

func _input(event):
	# For ESC escape button to quit the game. Need in each major scene!
	if event.is_action_pressed("exit"):
		get_tree().quit()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
