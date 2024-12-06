extends CanvasLayer

var scene = preload("res://Scenes/game_play_field.tscn")

func _ready() -> void:
	
	pass;


func _on_button_pressed() -> void:
	get_tree().change_scene_to_packed(scene);
	pass;
