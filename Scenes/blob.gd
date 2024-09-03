extends Area2D


var speed = 350
@export var direction = Vector2.RIGHT

func _process(delta: float) -> void:
	translate(direction * speed * delta)
