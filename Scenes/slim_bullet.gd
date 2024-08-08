extends Area2D

@export var speed = 20
var direction = Vector2.ZERO
var last_direction = Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_direction(direction: Vector2):
	self.direction = direction
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translate(Vector2.RIGHT.rotated(rotation) * speed)
