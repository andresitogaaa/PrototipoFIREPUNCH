extends Node2D




func _process(delta):
	if Global.Player_life == 3:
		$UI/Lifebar/HBoxContainer/Vida4.hide()
	elif Global.Player_life == 2:
		$UI/Lifebar/HBoxContainer/Vida3.hide()
	elif Global.Player_life == 1:
		$UI/Lifebar/HBoxContainer/Vida2.hide()
	elif Global.Player_life == 0:
		$UI/Lifebar/HBoxContainer/Vida.hide()


func _on_paneo_camara_boss_body_entered(body):
	if body.is_in_group("jugador"):
		Global.panning_camera = true



func _on_paneo_camara_boss_body_exited(body):
	if body.is_in_group("jugador"):
		Global.panning_camera = false


func _on_area_edificio_body_entered(body):
	if body.is_in_group("jugador"):
		$Edificios/Edificiofuera.hide()
		$Player.z_index = 1
		

func _on_area_edificio_body_exited(body):
	if body.is_in_group("jugador"):
		$Edificios/Edificiofuera.show()
		$Player.z_index = 0
