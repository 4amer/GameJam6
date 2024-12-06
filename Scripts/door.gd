extends Area2D

# Переменные для ключа и двери
var has_key = false
var door_opened = false

# Функция, вызываемая при столкновении с ключом
func _on_key_area_body_entered(body):
	if body.is_in_group("player"):  # Проверяем, что игрок собрал ключ
		has_key = true
		queue_free()  # Удаляем ключ из мира
		print("Ключ собран!")

# Функция для открытия двери
func _on_door_area_body_entered(body):
	if body.is_in_group("player") and has_key and not door_opened:  # Проверяем, есть ли ключ
		open_door()  # Вызываем функцию открытия двери

# Функция открытия двери
func open_door():
	door_opened = true
	print("Дверь открыта!")  # Здесь можно добавить анимацию открытия двери
	# Например: $AnimationPlayer.play("open_door") 

## Сигналы для коллизий
#func _ready():
	#$KeyArea.connect("body_entered", self, "_on_key_area_body_entered")  # Присоединяем сигнал для ключа
	#$DoorArea.connect("body_entered", self, "_on_door_area_body_entered")  # Присоединяем сигнал для двери
