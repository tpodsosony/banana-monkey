extends CharacterBody2D

@onready var _animation_player = $AnimationPlayer

const SPEED = 150.0
const JUMP_VELOCITY = -400.0

func _process(_delta):
	if Input.is_action_pressed("ui_right"):
		_animation_player.play("walk")
		$Sprite2D.flip_h=false
	elif Input.is_action_pressed("ui_left"):
		_animation_player.play("walk")
		$Sprite2D.flip_h=true
	else:
		_animation_player.stop()
		
	#if Input.is_action_pressed("ui_jab"):
		
	

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	if Input.is_action_just_pressed("ui_accept") and !is_on_floor():
		velocity.y = JUMP_VELOCITY
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	pass # Replace with function body.
