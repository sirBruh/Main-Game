extends CharacterBody2D


@export var speed = 30
@export var max_speed = 200
@export var friction = 3
@export var jump_velocity = -350
const blob = preload("res://Scenes/blob.tscn")
@onready var world = get_node("/root/World")
@onready var direction = Vector2.ZERO

@onready var sprite = $Sprite
var dead = false
#other vars
#@export var start_gravity = 1700
#@export var coyote_time = 140 # in ms
#@export var jump_buffer_time = 100 # in ms
#@export var jump_cut_multiplier = 0.4
#@export var AIR_HANG_MULTIPLIER = 0.95
#@export var AIR_HANG_THRESHOLD = 50
#@export var y_smoothing = 0.8
#@export var air_x_smoothing = 0.10
#@export var MAX_FALL_SPEED = 25000
func ready():
	pass
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	if dead:
		return
	else:# Add the gravity.
		if not is_on_floor():
			velocity.y += gravity * delta
		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		direction = Input.get_axis("walk_left", "walk_right")
		if direction:
			velocity.x = move_toward(velocity.x, direction * max_speed, speed)
		else:
			velocity.x = move_toward(velocity.x, 0,friction)
		#movement & playing the corresponding animations
		if Input.is_action_just_pressed("walk_left") or velocity.x < 0:
			sprite.flip_h = false
		elif Input.is_action_just_pressed("walk_right") or velocity.x > 0:
			sprite.flip_h = true
		#running animation
		if velocity.x != 0 and is_on_floor():
			sprite.play("run")
	#idle animation
		elif velocity.x == 0 and is_on_floor():
			sprite.play("idle")
	#jump animation
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = jump_velocity
			sprite.play("jump")
		move_and_slide()
#death
func _on_hitbox_area_entered(area):
	if area.is_in_group("Death"):
		dead = true
		sprite.play("death")
		await get_tree().create_timer(1).timeout
		get_tree().change_scene_to_file("res://Scenes/death_screen.tscn")
	elif area.is_in_group("End"):
		get_tree().change_scene_to_file("res://Scenes/win_screen.tscn")
#shooting code
func _input(event):
	if dead:
		return
	else:
		if event.is_action_pressed("Fire"):
			var new_blob = blob.instantiate()
			new_blob.global_position = global_position
			world.add_child(new_blob)
