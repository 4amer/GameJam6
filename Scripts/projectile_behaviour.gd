extends RigidBody2D


@export var speed: float = 500.0  # Speed of the projectile

# Set the direction for the projectile to travel
func set_direction_from_mouse(mouse_position: Vector2):
	var direction = (mouse_position - global_position).normalized()
	linear_velocity = direction * speed

func _ready():
	pass
