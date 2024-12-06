extends CharacterBody2D

@export var hp: int = 1;
@export var speed: int = 1;

var player = null;

func _ready():
	print("iuiyiyuiy");
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


func _on_area_2d_2_body_entered(body: Node2D) -> void:
	if(body.has_method("player")):
		player = get_parent().get_node("Character")
