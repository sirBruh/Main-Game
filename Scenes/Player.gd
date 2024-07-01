extends CharacterBody2D


@export var speed = 30
@export var max_speed = 200
@export var friction = 10
@export var jump_velocity = -400
@onready var sprite = $AnimatedSprite2D
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_velocity

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = move_toward(velocity.x, direction * max_speed, speed)
	else:
		velocity.x = move_toward(velocity.x, 0,friction)
	#movement
	if velocity.x != 0:
		if velocity.y == 0:
			sprite.play("run")
		if velocity.y != 0:
			sprite.play("jump")
	elif velocity.x == 0:
		if velocity.y == 0:
			sprite.play("idle")
		if velocity.y != 0:
			sprite.play("jump")
	
	#changing direction
	if direction > 0:
		sprite.flip_h = true
	elif direction < 0:
		sprite.flip_h = false
	move_and_slide()
	

func _on_hitbox_area_entered(area):
	if area.is_in_group("Death"):
		get_tree().reload_current_scene()
