extends Control

func _input(event):
	# For ESC escape button to quit the game. Need in each major scene!
	if event.is_action_pressed("exit"):
		get_tree().quit()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_play_again_pressed() -> void:
	# prints "Start pressed" to debugger screen thingie =)
	print("Play Again Pressed")
	get_tree().change_scene_to_file("res://Scenes/StartMenu.tscn")
	#var _reload = get_tree().reload_current_scene()

func _on_exit_pressed() -> void:
	# prints "Exit pressed" to debugger screen thingie =)
	print("Exit pressed")
	# this is the line to quit the game
	get_tree().quit()
