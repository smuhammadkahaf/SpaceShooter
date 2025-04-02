extends Control

func _ready():
	pass


func _on_start_game_pressed() :
	get_tree().change_scene_to_file("res://Scenes/Main.tscn");


func _on_exit_pressed():
	get_tree().quit();
