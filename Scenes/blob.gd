extends Area2D
var speed = 300
var direction = Vector2.RIGHT
func _process(delta: float) -> void:
	translate(direction * speed * delta)
func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Enemy"):
		queue_free()
