extends Node2D

var bulletCreator = preload("res://Entities/bullet/bullet.tscn");
var fireRate = 0.1
var currentFireRate = 0;
var speed:float = 300;
func _ready():
	pass

func _process(delta: float):
	currentFireRate +=delta;
	if Input.is_action_pressed("left") and Input.is_action_pressed("up"):
		position.x =  clamp(position.x - delta * speed,0+16,400-16);
		position.y =  clamp(position.y - delta * speed,0+16,600-16);
	elif Input.is_action_pressed("left") and Input.is_action_pressed("down"):
		position.y = clamp(position.y + delta * speed,0+16,600-16);
		position.x =  clamp(position.x - delta * speed,0+16,400-16);
	elif Input.is_action_pressed("right") and Input.is_action_pressed("up"):
		position.x =  clamp(position.x + delta * speed,0+16,400-16);
		position.y =  clamp(position.y - delta * speed,0+16,600-16);
	elif Input.is_action_pressed("right") and Input.is_action_pressed("down"):
		position.y = clamp(position.y + delta * speed,0+16,600-16);
		position.x =  clamp(position.x + delta * speed,0+16,400-16);
	elif Input.is_action_pressed("right"):
		position.x =  clamp(position.x + delta * speed,0+16,400-16);
	elif Input.is_action_pressed("left"):
		position.x =  clamp(position.x - delta * speed,0+16,400-16);
	elif Input.is_action_pressed("up"):
		position.y =  clamp(position.y - delta * speed,0+16,600-16);
	elif Input.is_action_pressed("down"):
		position.y = clamp(position.y + delta * speed,0+16,600-16);
		
	if Input.is_action_pressed("shootFront") and (currentFireRate>=fireRate):
		currentFireRate = 0
		var spawnBullet = bulletCreator.instantiate();
		spawnBullet.position.x = position.x;
		spawnBullet.position.y = position.y -23;
		get_parent().get_node("Bullets").add_child(spawnBullet);
		
	elif Input.is_action_pressed("shootBack") and (currentFireRate>=fireRate):
		currentFireRate = 0
		var spawnBullet = bulletCreator.instantiate();
		spawnBullet.position.x = position.x;
		spawnBullet.position.y = position.y + 23;
		spawnBullet.direction = -1;
		get_parent().get_node("Bullets").add_child(spawnBullet);
