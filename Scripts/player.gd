extends CharacterBody2D

const SPEED = 300.0
@export var bullet_speed = 1000;
@export var projectile_scene = preload("res://Nodes/Projectiles/projectile_coal.tscn");

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
	
	if Input.is_action_just_pressed("Shoot"):
		spawn_projectile();
	
	velocity = velocity.normalized();
	velocity *= SPEED;
	
	$aim.look_at(get_global_mouse_position())
	
	move_and_slide()

func spawn_projectile() -> void:
	var bullet_instance = projectile_scene.instantiate();
	bullet_instance.position = $aim/shooterPoint.global_position;
	bullet_instance.rotation_degrees = $aim.rotation_degrees;
	bullet_instance.apply_impulse(Vector2(bullet_speed, 0).rotated($aim.rotation))
	get_tree().get_root().call_deferred("add_child", bullet_instance);
	
