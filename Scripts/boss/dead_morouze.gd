extends CharacterBody2D

var stageCounter = 1;
var hp = 80;

var currentSpeed = 100;

var first_phase_speed = 3;

@export var obstacle : Node2D;
@export var pointToSetPosition : Node2D;
@export var hpBar : ProgressBar;
@export var HpWindow : Panel;

var treeEnemy = preload("res://Nodes/Enemies/overgreen_tree_enemy.tscn");

var isFightStarted = false;
var movementDone = false;

var playerPosition = Vector2(0,0);
var player;

func init():
	HpWindow.show();
	isFightStarted = true;
	start_first_phase();
	obstacle.position = pointToSetPosition.position
	obstacle.show();
	player = get_parent().get_node("Character");

func _physics_process(delta: float) -> void:
	if isFightStarted == true and movementDone == false:
		position += (playerPosition - position).normalized() * currentSpeed;
	print(position.distance_to(playerPosition))
	if(position.distance_to(playerPosition) <= 5):
		movementDone = true;
	move_and_slide()

func start_first_phase():
	currentSpeed = first_phase_speed;
	$RunTimer.start();
	pass;

func start_second_phase():
	currentSpeed = first_phase_speed;
	$SpawnElfTimer.start();
	pass;

func _on_run_timer_timeout() -> void:
	movementDone = false;
	playerPosition = player.position;
	pass;

func enemy():
	pass;


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("projectile"):
		SunstractHP();

func SunstractHP():
	hp -= 1;
	hpBar.value = hp;
	if hp <= 40:
		start_second_phase();
	
	if hp <= 0:
		get_tree().change_scene_to_file("res://Scenes/win_scene.tscn");


func _on_spawn_elf_timer_timeout() -> void:
	var enemy_instance = treeEnemy.instantiate()
	get_tree().get_root().call_deferred("add_child", enemy_instance);
	enemy_instance.init(player);
	enemy_instance.global_position = global_position;
