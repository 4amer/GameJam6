extends CanvasLayer

var main_scene = preload("res://Scenes/main_scene.tscn");
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$santadeath.play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	get_tree().change_scene_to_packed(main_scene);
