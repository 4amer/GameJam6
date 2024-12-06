extends StaticBody2D

@export var tree : Node2D;

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		tree.init(body);
		queue_free()
