extends Control
@onready var sprite1 = $Play/AnimatedSprite2D_Play
@onready var sprite2 = $Play/AnimatedSprite2D_How_to_Play
@onready var sprite3 = $Play/AnimatedSprite2D_Quit

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_pressed():
	sprite1.play("Pressed")
	get_tree().change_scene_to_file("res://Scenes/world.tscn")


func _on_exit_pressed():
	sprite3.play("Pressed")
	get_tree().quit()


func _on_how_to_play_pressed():
	sprite2.play("Pressed")
