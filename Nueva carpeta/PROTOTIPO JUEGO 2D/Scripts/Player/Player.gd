extends CharacterBody2D

var input
@export var speed = 100.0
@export var gravity = 10
@onready var gun = $Arma
# VARIABLE FOR JUMPING
var jump_count = 0
@export var max_jump = 2
@export var jump_force = 500

var direction = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _physics_process(delta):
	
	if Input.is_action_just_pressed("atacar"):
		gun.shoot()
	
	direction.x = Input.get_axis("ui_left", "ui_right")
	direction.y = Input.get_axis("ui_up", "ui_down")
		
	if direction != Vector2.ZERO:
		gun.setup_direction(direction)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	movement(delta)

func movement(delta):
	input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	if input != 0:
		if input > 0:
			velocity.x += speed * delta
			velocity.x = clamp(speed, 100.0, speed)
			$Sprite2D.flip_h = false
		if input < 0:
			velocity.x -= speed * delta
			velocity.x = clamp(-speed, 100.0, -speed)
			$Sprite2D.flip_h = true
	if input == 0:
		velocity.x = 0
		
# CODE RELATED TO JUMPING
	if is_on_floor():
		jump_count = 0
	
	if Input.is_action_pressed("ui_accept") && is_on_floor() && jump_count < max_jump:
		jump_count += 1
		velocity.y -= jump_force
		velocity.x = input
	if !is_on_floor() && Input.is_action_just_pressed("ui_accept") && jump_count < max_jump:
		jump_count += 1
		velocity.y -= jump_force * 1.2
		velocity.x = input
	if !is_on_floor() && Input.is_action_just_released("ui_accept") && jump_count < max_jump:
		velocity.y = gravity
		velocity.x = input
	else:
		gravity_force()
		
	gravity_force()
	move_and_slide()

func gravity_force():
	velocity.y += gravity

