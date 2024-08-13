extends Area2D

@export var speed = 20
@onready var bullet = $Sprite2D
@onready var direction = Vector2.ZERO
@onready var last_direction = "right"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_direction():
	if direction > 0:
		last_direction = "right"
		bullet.flip_h = false
	elif direction < 0:
		last_direction = "left"
		bullet.flip_h = true

	if last_direction == "right":
		direction = Vector2.RIGHT
	elif last_direction == "left":
		direction = Vector2.LEFT
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translate(direction * speed)

