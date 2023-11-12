extends Node2D
class_name Water

@onready var collision = get_node("IceCollision")
@onready var sprite = get_node("Sprite")
var frozen = false
var neighbors: Array

func _process(delta):
	pass

func freeze():
	sprite.frame = 1
	collision.set_collision_layer_value(1, true)
	

func melt():
	sprite.frame = 0
	collision.set_collision_layer_value(1, false)


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		frozen = true
		freeze()


func _on_area_2d_body_exited(body):
	if body.name == "Player":
		frozen = false
		melt()

