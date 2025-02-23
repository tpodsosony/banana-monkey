## PSA: Ctrl + K to comment out, ctrl + / to go back
extends TextureProgressBar


## reference the player 1 variable (we use export to be able to get it here)
@export var player_1: player_1
# reference value from TextureProgressBar


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var root_node = get_parent()
	player_1.connect("healthChanged", update)
	update()

func update():
	value = player_1.currentHealth * 100 / player_1.MAX_HEALTH

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	update()
	
