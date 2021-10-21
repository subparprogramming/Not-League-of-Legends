extends Camera2D


# member variables
var locked_screen = true
var player


# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node("/root/Main/Player")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if locked_screen:
		position.x = player.position.x
		position.y = player.position.y
