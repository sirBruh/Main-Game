extends Area2D

@export var speed = 20
@onready var bullet = $Sprite2D
var direction = Player.direction
var direction_facing = Player.direction_facing

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_direction():
	if direction > 0:
		bullet.flip_h = false
		direction_facing = "right"
	elif direction < 0:
		bullet.flip_h = true
		direction_facing = "left"
	if direction_facing == "right":
		direction = Vector2.RIGHT
	elif direction_facing == "left":
		direction = Vector2.LEFT
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if direction != Vector2.ZERO:
		var velocity = direction * speed
		global_position += velocity

