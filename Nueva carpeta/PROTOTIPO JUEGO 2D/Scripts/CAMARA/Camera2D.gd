extends Camera2D

@onready var player = $"../Player"
@export var camera: camera_state
enum camera_state {FOLLOW, PANNING}

var vueltaCamara = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.panning_camera:
		camera_panning(delta)
	

func camera_panning(delta):
	if offset.x <= 220 and !vueltaCamara:
		offset.x += 100 * delta
	elif offset.x >= 220 and !vueltaCamara:
		vueltaCamara = true
	elif offset.x > 0 and vueltaCamara:
		offset.x -= 100 * delta
	elif offset.x <= 0 and vueltaCamara:
		offset.x = 0
		Global.player_speed = 100.0
		Global.panning_camera = false
