extends Sprite2D

var speed = 10.0
var dir = Vector2.ZERO
var screen_size
var can_move = false

func _ready():
	set_process(false)
	screen_size = get_viewport_rect().size

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				dir = get_global_mouse_position()
				print_debug(dir)
				can_move = true
				set_process(true)

func _process(delta):
	if can_move:
		if dir.distance_to(global_position) > 0:
			print_debug("move", dir)
			global_position = global_position.move_toward(dir, speed)
		else:
			can_move = false
			set_process(false)
	
