extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	# prints "Start pressed" to debugger screen thingie =)
	print("Start pressed")
	get_tree().change_scene_to_file("res://Scenes/FightingScene.tscn")


func _on_exit_pressed() -> void:
	# prints "Exit pressed" to debugger screen thingie =)
	print("Exit pressed")
	# this is the line to quit the game
	get_tree().quit()
