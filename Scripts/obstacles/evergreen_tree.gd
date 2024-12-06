extends Node2D

var hp = 5;
@export var door: Node2D;

func _on_area_2d_body_entered(body: Node2D) -> void:
	var name = body.name;
	if body.has_method("projectile"):
		hp -= 1;
		$ProgressBar.value = hp;
		if hp <= 0:
			open_door();
			queue_free();

func open_door():
	door.queue_free();
