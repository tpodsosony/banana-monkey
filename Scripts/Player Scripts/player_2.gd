extends CharacterBody2D

# we make a class for the health bar script
class_name player_2
# signal also for health bar, so can get updated
signal healthChanged

@onready var _animation_player = $AnimationPlayer

@onready var projectile = preload("res://Scenes/projectile.tscn")

const SPEED = 150.0
const JUMP_VELOCITY = -400.0

# set up variables
var player_2
var player_1
var currentHealth
var maxHealth = 100
var isHurt
var curDirection

# ready runs when this node first starts
func _ready() -> void:
	var root_node = get_parent()
	player_1 = root_node.get_node("Player1")
	currentHealth = maxHealth
	
func _process(_delta):
	# Player 2 movement vector
	var velocity = Vector2.ZERO
	# Directions for moving, from: https://docs.godotengine.org/en/stable/getting_started/first_2d_game/03.coding_the_player.html 
	if Input.is_action_pressed("p2_right"):
		velocity.x += 1
	if Input.is_action_pressed("p2_left"):
		velocity.x -= 1
	# 
	## Play walking animation if moving, otherwise no -CH (I think Tal already does this later maybe, so this not needed)
	#if velocity.length() > 0:
		#$AnimatedSprite2D.play()
	#else:
		#$AnimatedSprite2D.stop()
	
	# at some point wanted to print positions but not needed any more
	# print("Player1: Position")
	# print(self.position.x)
	
	
		
	#if Input.is_action_pressed("ui_jab"):
		
	

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("p2_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	# not sure what this is for -CH
	shoot()
	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("p2_left", "p2_right")
	if direction:
		_animation_player.play("walk")
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		_animation_player.stop()
		
	if player_1.position.x > self.position.x:
		$Sprite2D.flip_h=false
		curDirection = 1
	else:
		$Sprite2D.flip_h=true
		curDirection = -1

	move_and_slide()
	
# Make sure "healthChanged" is emitted each time the player takes damage or heals (no heal for us)
func hurtByEnemy(_area):
	currentHealth -= 10
	if currentHealth < 0:
		currentHealth = 0
	isHurt = true
	healthChanged.emit()
	
	# then knockback stuff...
	# https://www.youtube.com/watch?v=UEJcUnq2dfU
	# at  4:03
	
func shoot():
	if Input.is_action_just_pressed("p2_b"):
		var projectile_temp = projectile.instantiate()
		projectile_temp.global_position = position
		owner.add_child(projectile_temp)
		projectile_temp.direction = curDirection
		projectile_temp._animation_player.play("shoot")
	
	# Set the projectile's starting position
		projectile_temp.position = position
		
