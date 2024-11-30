extends CharacterBody2D

var Gravedad = 9.8
var speed = 1800
var direction = -1
var idle_state = false

#func _ready():
	#velocity.x = -speed


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	movimiento(delta)
	move_and_slide()
	
func _process(delta):
	print(idle_state)
	if speed > 0:
		$AnimatedSprite2D.play("correr")
	if $RayCast2D.is_colliding() and !idle_state or $RayCast2D2.is_colliding() and !idle_state:
		idle_state = true
		$AnimatedSprite2D.play("default")
		speed = 0
		$idleTimer.start()
		
	

func _on_area_2d_body_entered(body):
	if body.is_in_group("jugador"):
		var y_delta = position.y - body.position.y
		if (y_delta > 30):
			print("Destroy enemy")
		else:
			print("Decrease player health")
			Global.Player_life -= 1
		
func get_damage(damage):
	speed = 0
	$AnimatedSprite2D.play("muerte")
	$Timer.start()
	#queue_free()
		
		

func _on_timer_timeout():
	queue_free()
	
func movimiento(delta):
	velocity.y += Gravedad
	velocity.x = direction * speed * delta
	if direction == -1 and $RayCast2D.is_colliding():
		direction = 1
	elif direction == 1 and $RayCast2D2.is_colliding():
		direction = -1
	if $RayCast2D2.is_colliding():
		$AnimatedSprite2D.flip_h = false
	elif $RayCast2D.is_colliding():
		$AnimatedSprite2D.flip_h = true


func _on_idle_timer_timeout():
	speed = 1800
	idle_state = false
	
