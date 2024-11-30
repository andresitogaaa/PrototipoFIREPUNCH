extends ParallaxBackground


func _process(delta):
		$ParallaxLayer2.motion_offset.x += -10*delta
		$ParallaxLayer6.motion_offset.x += -30*delta
		$ParallaxLayer3.motion_offset.x += -40*delta
		$ParallaxLayer4.motion_offset.x += -50*delta
		$ParallaxLayer5.motion_offset.x += -60*delta
		$ParallaxLayer7.motion_offset.x += -70*delta
