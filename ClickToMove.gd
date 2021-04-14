extends KinematicBody2D

var speed = 200
var target = null
var velocity = Vector2.ZERO

func _input(event):
	if event.is_action_pressed('click'):
		target = event.position

func _physics_process(delta):
	if target:
		look_at(target)
		velocity = transform.x * speed
		
		if position.distance_to(target) > 5:
			velocity = move_and_slide(velocity)
