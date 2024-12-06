extends CharacterBody2D

func _ready():
	pass

func _physics_process(delta: float) -> void:
	var player = get_parent().get_node("Character")
	
	position += (player.position - position) / 100
	
	move_and_slide()
