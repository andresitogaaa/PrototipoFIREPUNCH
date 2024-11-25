extends Node2D

@export var shootspeed = 1.0

const BALA = preload("res://ESCENAS/BALA.tscn")
@onready var marker_2d = $Marker2D
@onready var Shoot_speed_timer = $Shootspeedtimer

var canShoot = true
var bulletDirection = Vector2(1,0)

func _ready():
	Shoot_speed_timer.wait_time = 1.0 / shootspeed
	
func shoot():
	if canShoot:
		canShoot = false
		Shoot_speed_timer.start()
		
		var bulletNode = BALA.instantiate()
		
		bulletNode.set_direction(bulletDirection)
		get_tree().root.add_child(bulletNode)
		bulletNode.global_position = marker_2d.global_position
	

func _on_shootspeedtimer_timeout():
	canShoot = true
	
func setup_direction(direction):
	bulletDirection = direction
		
	if direction.x > 0:
		scale.x = 1
		rotation_degrees = 0
	elif direction.x < 0:
		scale.x = 1
		rotation_degrees = 0
	elif direction.y < 0:
		scale.x = 1
		rotation_degrees = -90
	elif direction.y > 0:
		scale.x = 1
		rotation_degrees = 90
