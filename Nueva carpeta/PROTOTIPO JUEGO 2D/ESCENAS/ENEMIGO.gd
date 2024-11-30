extends CharacterBody2D

var Gravedad = 9.8
var speed = 20



func _ready():
	velocity.x = -speed


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity.y += Gravedad
	
	#if is_on_wall():
	if velocity.x > 0:
		velocity.x = -speed
	elif velocity.x < 0:
		velocity.x = speed
	
	if velocity.x < 0:
		$AnimatedSprite2D.flip_h = false
	elif velocity.x > 0:
		$AnimatedSprite2D.flip_h = true
	
	move_and_slide()


func _on_area_2d_body_entered(body):
	if body.is_in_group("jugador"):
		var y_delta = position.y - body.position.y
		if (y_delta > 30):
			print("Destroy enemy")
		else:
			print("Decrease player health")
			Global.Player_life -= 1
		
func get_damage(damage):
	$AnimatedSprite2D.play("muerte")
	$Timer.wait_time = 1
	$Timer.start()
	#queue_free()
		
		
