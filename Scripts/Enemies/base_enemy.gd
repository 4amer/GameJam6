extends CharacterBody2D

@export var hp: int = 1;

func _ready():
	pass

func _physics_process(delta: float) -> void:
	var player = get_parent().get_node("Character")
	
	position += (player.position - position) / 100
	
	move_and_slide()

func SubstractHP():
	hp -= 1;
	if hp <= 0:
		queue_free();

func enemy():
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Projectile_Coal":
		SubstractHP();
