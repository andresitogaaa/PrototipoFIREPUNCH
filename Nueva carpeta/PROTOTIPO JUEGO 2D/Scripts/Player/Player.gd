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

var Muerte = false

func _ready():
	Global.Player_life = 4
	$Sprite2D.play("idle")


func _physics_process(delta):
	if Global.Player_life > 0:
		if Input.is_action_just_pressed("atacar"):
			gun.shoot()
		
		direction.x = Input.get_axis("ui_left", "ui_right")
		direction.y = Input.get_axis("ui_up", "ui_down")
			
		if direction != Vector2.ZERO:
			gun.setup_direction(direction)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	speed = Global.player_speed
	Global.player_velocity = velocity
	if Global.Player_life > 0:
		movement(delta)
	elif Global.Player_life == 0 and !Muerte:
		if $Sprite2D.flip_h:
			$Sprite2D.flip_h = false
		else:
			$Sprite2D.flip_h = true
		$Sprite2D.play("Muerteanimacion")
		Muerte = true
		

func movement(delta):
	input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	if input != 0:
		if input > 0:
			velocity.x += speed * delta
			velocity.x = clamp(speed, 100.0, speed)
			$Sprite2D.flip_h = false
			$Sprite2D.play("correr")
		if input < 0:
			velocity.x -= speed * delta
			velocity.x = clamp(-speed, 100.0, -speed)
			$Sprite2D.flip_h = true
			$Sprite2D.play("correr")
	if input == 0:
		velocity.x = 0
		$Sprite2D.play("idle")
		
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

func _on_sprite_2d_animation_finished():
	if $Sprite2D.get_animation() == "Muerteanimacion":
		get_tree().change_scene_to_file("res://LEVELS/level_1.tscn")
