extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_pressed():
	await get_tree().create_timer(.2).timeout
	get_tree().change_scene_to_file("res://Scenes/world.tscn")

func _on_how_to_play_pressed():
	await get_tree().create_timer(.2).timeout
	get_tree().change_scene_to_file("res://Scenes/help_screen.tscn")

func _on_quit_pressed():
	get_tree().quit()
