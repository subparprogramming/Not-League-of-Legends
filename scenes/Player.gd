extends KinematicBody2D


# member variables
export var speed = 200  # player movespeed (px/s)
var target = Vector2()  # clicked position


# Called when the node enters the scene tree for the first time.
func _ready():
	target = position

# Called when an input event is triggered
func _unhandled_input(event):
	if event is InputEventMouseButton \
		and event.pressed \
		and event.button_index == BUTTON_RIGHT:
			target = get_global_mouse_position()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2()  # player's movement vector
	
	# move toward target and stop when close
	if position.distance_to(target) > 2:
		velocity = target - position
	
	# calculate velocity
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	
	# calculate new position
	position += velocity * delta
	#position.x = clamp(position.x, 0, screen_size.x)
	#position.y = clamp(position.y, 0, screen_size.y)
