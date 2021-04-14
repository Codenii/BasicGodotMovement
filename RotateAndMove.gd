extends KinematicBody2D

var speed = 200
var rotation_speed = 1.5

var velocity = Vector2.ZERO
var rotation_dir = 0

func get_input():
	rotation_dir = 0
	velocity = Vector2.ZERO
	
	if Input.is_action_pressed('right'):
		rotation_dir += 1
	if Input.is_action_pressed('left'):
		rotation_dir -= 1
	if Input.is_action_pressed('down'):
		velocity -= transform.x * speed
	if Input.is_action_pressed('up'):
		velocity += transform.x * speed

func _physics_process(delta):
	get_input()
	rotation += rotation_dir * rotation_speed * delta
	velocity = move_and_slide(velocity)
