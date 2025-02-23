extends Area2D

@onready var _animation_player = $AnimationPlayer

var damageGroup

var speed = 300
var direction = 1 # Default, but will be set by the player

func _ready():
	scale.x = direction  # Flip the sprite if moving left (this solves frozen banana issue)

func _physics_process(delta):
	position.x += speed * direction * delta
	_animation_player.play("throw")

func destroy():
	queue_free()
	
func _on_body_entered(_body):
	print(_body)
	destroy()
	
	


func _on_area_entered(area: Area2D):
	print(area)
	destroy()
