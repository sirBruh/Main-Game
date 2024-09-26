extends Node2D

@export var mute: bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if not mute:
		play_music()
func play_music():
	if get_tree().current_scene.name == "res://Scenes/menu.tscn":
		$Menumusic.play
	if get_tree().current_scene.name == "res://Scenes/world.tscn":
		$Mainmusic.play
	if get_tree().current_scene.name == "res://Scenes/win_screen.tscn":
		$Endmusic.play
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
