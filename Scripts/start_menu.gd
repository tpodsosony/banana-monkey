extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Initially hide the controls
	$Controls.hide()
	$Credits.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	# prints "Start pressed" to debugger screen thingie =)
	print("Start pressed")
	get_tree().change_scene_to_file("res://Scenes/FightingScene.tscn")

# This function is connected to the toggle button
func _on_controls_toggled(toggled_on: bool) -> void:
	# Show or hide controls based on toggle state
	if toggled_on:
		$Controls.visible = true
	else:
		$Controls.visible = false

func _on_credits_toggled(toggled_on: bool) -> void:
	# Show or hide credits based on toggle state
	if toggled_on:
		$Credits.visible = true
	else:
		$Credits.visible = false

func _on_exit_pressed() -> void:
	# prints "Exit pressed" to debugger screen thingie =)
	print("Exit pressed")
	# this is the line to quit the game
	get_tree().quit()


func _on_play_again_pressed() -> void:
	pass # Replace with function body.
