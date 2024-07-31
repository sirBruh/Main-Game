extends CharacterBody2D


@export var speed = 30
@export var max_speed = 200
@export var friction = 10
@export var jump_velocity = -400
#other vars
@export var start_gravity = 1700
@export var coyote_time = 140 # in ms
@export var jump_buffer_time = 100 # in ms
@export var jump_cut_multiplier = 0.4
@export var AIR_HANG_MULTIPLIER = 0.95
@export var AIR_HANG_THRESHOLD = 50
@export var y_smoothing = 0.8
@export var air_x_smoothing = 0.10
@export var MAX_FALL_SPEED = 25000
@onready var sprite = $AnimatedSprite2D
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.

		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = move_toward(velocity.x, direction * max_speed, speed)
	else:
		velocity.x = move_toward(velocity.x, 0,friction)
	#movement & playing the corresponding animations
	
	#running animation
	if velocity.x != 0 and is_on_floor():
			sprite.play("run")
	#idle animation
	elif velocity.x == 0 and is_on_floor():
			sprite.play("idle")
	#jump animation
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_velocity
		sprite.play("jump")		
	
	#changing direction
	if direction > 0:
		sprite.flip_h = true
	elif direction < 0:
		sprite.flip_h = false
	move_and_slide()
	
#death
func _on_hitbox_area_entered(area):
	if area.is_in_group("Death"):
		get_tree().change_scene_to_file("res://Scenes/menu.tscn")
