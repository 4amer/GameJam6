extends RigidBody2D

func projectile():
	pass

func _ready() -> void:
	$Timer.start();

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("enemy"):
		queue_free();

func _on_timer_timeout() -> void:
	queue_free();
