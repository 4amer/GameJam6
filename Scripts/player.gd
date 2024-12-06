extends CharacterBody2D

const SPEED = 300.0

func _physics_process(delta: float) -> void:
	var direction: Vector2 = Vector2.ZERO;
	direction.x = Input.get_axis("ui_left", "ui_right");
	direction.y = Input.get_axis("ui_up", "ui_down");
	if direction.x:
		velocity = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if direction.y:
		velocity = direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	velocity = velocity.normalized();
	velocity *= SPEED;
	
	move_and_slide()
