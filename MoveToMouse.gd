extends KinematicBody2D

var speed = 200
var velocity = Vector2.ZERO

func get_input():
	velocity = Vector2.ZERO
	if Input.is_action_pressed("up"):
		velocity += transform.x * speed
	if Input.is_action_pressed("down"):
		velocity -= transform.x * speed

func _physics_process(delta):
	look_at(get_global_mouse_position())
	get_input()
	velocity = move_and_slide(velocity)
