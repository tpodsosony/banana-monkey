extends CharacterBody2D

# we make a class for the health bar script
class_name player_2
# signal also for health bar, so can get updated
signal healthChanged

@onready var _animation_player = $AnimationPlayer

@onready var projectile = preload("res://Scenes/projectile.tscn")

const SPEED = 150.0
const JUMP_VELOCITY = -500.0
const MAX_HEALTH = 100

# set up variables
var player_2
var player_1
var p1_win
var end_menu
var currentHealth
var isHurt
var curDirection
var canMove : bool

# ready runs when this node first starts
func _ready() -> void:
	var root_node = get_parent()
	player_1 = root_node.get_node("Player1")
	p1_win = root_node.get_node("WinLose/P1Win")
	currentHealth = MAX_HEALTH
	canMove = true
	
func _process(_delta):
	# Player 2 movement vector
	if velocity == Vector2.ZERO:
		_animation_player.play("idle")


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if canMove:
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
		
		projectile_temp.damageGroup = "Player_1"
		AudioController.play_throw_p2()
		
func OnHit(damage: int):
	currentHealth -= damage
	validateHealth()
	
func validateHealth():
	if(currentHealth < 0):
		currentHealth = 0
		canMove = false
		p1_win.visible = true
		#$VBoxContainer.visible = true
