extends CharacterBody2D

@export var hp: int = 1;
@export var speed: int = 1;

var player = null;

func init(body: Node2D):
	player = body;
	$".".show();
	$Sprite2D.show();

func _ready():
	pass

func _physics_process(delta: float) -> void:
	if player != null:
		position += (player.position - position).normalized() * speed;
	move_and_slide()

func SubstractHP():
	hp -= 1;
	if hp <= 0:
		queue_free();

func enemy():
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("projectile"):
		SubstractHP();
