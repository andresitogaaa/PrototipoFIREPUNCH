extends Camera2D

@onready var player = $"../Player"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func camera_panning():
	position = player.position
	var x = floor(position.x / 320) * 320
	var y = floor(position.y / 180) * 180
