extends Node
var enemies = preload("res://Entities/Enemy/enemy.tscn");
func _ready():
	var timer =Timer.new();
	add_child(timer);
	timer.wait_time =1;
	timer.connect ("timeout",Callable(self,"_spawnEnemy"));
	timer.start();

func _process(delta):
	pass

func _spawnEnemy():
	var spawner = enemies.instantiate()
	get_parent().get_node("enemy").add_child(spawner);
