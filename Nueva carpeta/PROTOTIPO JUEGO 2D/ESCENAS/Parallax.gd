extends ParallaxBackground



#func _process(delta):
	#if Global.player_velocity.x != 0:
		#$ParallaxLayer2.motion_offset.x += -10*delta
		#$ParallaxLayer6.motion_offset.x += -20*delta
		#$ParallaxLayer3.motion_offset.x += -40*delta
