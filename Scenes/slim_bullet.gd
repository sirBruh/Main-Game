extends Area2D

@export var speed = 20
var direction = Vector2.ZERO
var last_direction = "right"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_direction():
	if last_direction == "right":
		direction = Vector2.RIGHT
	else:
		direction = Vector2.LEFT
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translate(direction * speed)
