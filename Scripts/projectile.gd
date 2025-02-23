extends Area2D

@onready var _animation_player = $AnimationPlayer

var speed = 300
var direction = 1

func _physics_process(delta):
	position.x += speed * direction * delta
	_animation_player.play("throw")
	
func _on_body_entered(body):
	queue_free()
