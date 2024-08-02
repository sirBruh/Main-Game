extends Area2D
@export var left_limit = 0
@export var right_limit = 0
var direction = 1
@onready var sprite = $AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translate(Vector2.RIGHT * direction)
	if direction < 0:
		sprite.flip_h = true
	elif direction > 0:
		sprite.flip_h = false
	if position.x > right_limit:
		direction = -1
	elif position.x < left_limit:
		direction = 1



