extends Node2D

@export var deadMorouze : Node2D;

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		deadMorouze.init();
		queue_free();
