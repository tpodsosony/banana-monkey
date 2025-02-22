extends CharacterBody2D
class_name player_1
signal healthChanged

@onready var _animation_player = $AnimationPlayer

@onready var gameref = get_parent()

const SPEED = 150.0
const JUMP_VELOCITY = -400.0

# set up variables
var player_1
var player_2
var currentHealth
var maxHealth = 100
var isHurt

# ready runs when this node first starts
func _ready() -> void:
	var root_node = get_parent()
	player_2 = root_node.get_node("Player2")
	currentHealth = maxHealth
	
func _process(_delta):
	if Input.is_action_pressed("ui_right"):
		_animation_player.play("walk")
	elif Input.is_action_pressed("ui_left"):
		_animation_player.play("walk")
		
	else:
		_animation_player.stop()
		
	if player_2.position.x > self.position.x:
		$Sprite2D.flip_h=false
	else:
		$Sprite2D.flip_h=true
		
	print("Player1: Position")
	print(self.position.x)
	
	
		
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
	
# Make sure "healthChanged" is emitted each time the player takes damage or heals (no heal for us)
func hurtByEnemy(_area):
	currentHealth -= 10
	if currentHealth < 0:
		currentHealth = maxHealth
	isHurt = true
	healthChanged.emit()
	
	# then knockback stuff...
	# https://www.youtube.com/watch?v=UEJcUnq2dfU
	# at  4:03
	
	
