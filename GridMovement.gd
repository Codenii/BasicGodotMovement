extends Area2D

onready var tween = $Tween
onready var ray = $RayCast2D
onready var player = get_node(".")

export var speed = 3

var tile_size = 64
var screen_size = Vector2(0,0)
var starting_pos = Vector2(0,0)
var temp_pos = Vector2(0,0)
var inputs = {
	"right": 	Vector2.RIGHT,
	"left": 	Vector2.LEFT,
	"up":		Vector2.UP,
	"down":		Vector2.DOWN
}

func _ready():
	position = starting_pos
	position = position.snapped(Vector2.ONE * tile_size)
	position += Vector2.ONE * tile_size/2
	print("Position is at: {pos}".format({"pos": player.get_position()}))
	screen_size = OS.get_window_size()
	print("Window Size is: {scr}".format({"scr": screen_size}))

func _process(delta):
	screen_size = OS.get_window_size()

func _unhandled_input(event):
	if tween.is_active():
		return
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			move(dir)

func move(dir):
	temp_pos = position 
	temp_pos += inputs[dir] * tile_size
	if temp_pos.x <= 0 or temp_pos.y <= 0 or temp_pos.x > screen_size.x or temp_pos.y >= screen_size.y:
		print("Error moving")
	else:
		ray.cast_to = inputs[dir] * tile_size
		ray.force_raycast_update()
		if !ray.is_colliding():
			position += inputs[dir] * tile_size

	print("Position is at: {pos}".format({"pos": player.get_position()}))
