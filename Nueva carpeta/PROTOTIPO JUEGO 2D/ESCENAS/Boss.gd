extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

		
func get_damage(damage):
	queue_free()
	Global.jefederrotado = true


func _on_area_2d_body_entered(body):
	if body.is_in_group("jugador"):
		var y_delta = position.y - body.position.y
		if (y_delta > 30):
			print("Destroy enemy")
		else:
			print("Decrease player health")
			Global.Player_life -= 1
