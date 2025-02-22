extends CharacterBody2D

@onready var _animation_player = $AnimationPlayer

@onready var player_2 = get_tree()

const SPEED = 150.0
const JUMP_VELOCITY = -400.0

func _process(_delta):
	if Input.is_action_pressed("ui_right"):
		_animation_player.play("walk")
	elif Input.is_action_pressed("ui_left"):
		_animation_player.play("walk")
		
	else:
		_animation_player.stop()
		
	if player_2 < self.position.x:
		$Sprite2D.flip_h=false
	else:
		$Sprite2D.flip_h=true
	
	
		
	#if Input.is_action_pressed("ui_jab"):
		
	

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

	


func _on_player_2_position() -> void:
	pass # Replace with function body.
