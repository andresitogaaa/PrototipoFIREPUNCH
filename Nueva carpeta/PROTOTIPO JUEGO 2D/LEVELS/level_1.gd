extends Node2D




@onready var life_icons = [
	$UI/Lifebar/HBoxContainer/Vida,
	$UI/Lifebar/HBoxContainer/Vida2,
	$UI/Lifebar/HBoxContainer/Vida3,
	$UI/Lifebar/HBoxContainer/Vida4
]
	
func _process(delta):
	if Global.jefederrotado:
		$Paredarena2/CollisionShape2D.disabled = true
	for i in range(len(life_icons)):
		life_icons[i].visible = Global.Player_life > i


func _on_paneo_camara_boss_body_entered(body):
	if body.is_in_group("jugador"):
		Global.panning_camera = true
		Global.player_speed = 0
		call_deferred("habilitar_colision")



func _on_paneo_camara_boss_body_exited(body):
	if body.is_in_group("jugador"):
		$PaneoCamaraBoss/CollisionShape2D.disabled = true


func _on_area_edificio_body_entered(body):
	if body.is_in_group("jugador"):
		$Edificios/Edificiofuera.hide()
		$Player.z_index = 1
		

func _on_area_edificio_body_exited(body):
	if body.is_in_group("jugador"):
		$Edificios/Edificiofuera.show()
		$Player.z_index = 0

func habilitar_colision():
	$Paredarena/CollisionShape2D.disabled = false
	


func _on_areafinal_body_entered(body):
	$AnimationPlayer.play("Transicionfinal")
	$UI.hide()
	$areafinal/Timer.start()


func _on_timer_timeout():
	get_tree().change_scene_to_file("res://ESCENAS/avisodemo.tscn")
