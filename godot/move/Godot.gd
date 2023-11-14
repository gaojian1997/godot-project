extends Node2D

var speed = 100
var screen_size

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	
	if Input.is_action_pressed("attack"):
		$Action.play("attack")
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$Action.play("walk")
	else:
		$Action.stop()
	
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
