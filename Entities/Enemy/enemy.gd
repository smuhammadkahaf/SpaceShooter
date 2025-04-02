class_name  Enemy
extends Node2D

var enemySpeed = 250;
func _ready():
	randomize();
	position = Vector2 (randf_range(0+16,400-16),0+16)
	get_node("EnemyShip").connect("area_entered",Callable(self,"_baseEntry"));

func _process(delta):
	position.y += delta * enemySpeed;

func _baseEntry(body:Node):
	if body.name == "base" or body.name == "playerShip":
		get_tree().paused=true;
