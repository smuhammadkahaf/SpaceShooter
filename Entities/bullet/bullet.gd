
extends Node2D

var bulletSpeed=350
var direction = 1
func _ready():
	
	get_node("bulletRange").connect("area_entered",Callable(self,"_destroy"));

func _process(delta):
	position.y = position.y - delta*bulletSpeed* direction;
	if position.y<0:
		queue_free();
		

func _destroy(body:Node2D):
	if body.name == "EnemyShip":
		body.get_parent().queue_free();
		queue_free()
