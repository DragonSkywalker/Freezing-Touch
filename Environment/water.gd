extends Node2D
class_name Water

@onready var collision = get_node("IceCollision")
@onready var sprite = get_node("Sprite")
var freeze_source = false
var neighbors: Array
var actually_frozen = false

func _process(delta):
	if freeze_source:
		freeze_everyone()

func freeze():
	actually_frozen = true
	sprite.frame = 1
	collision.set_collision_layer_value(1, true)
	

func melt():
	actually_frozen = false
	sprite.frame = 0
	collision.set_collision_layer_value(1, false)


func freeze_everyone():
	for n in neighbors:
		if not n.actually_frozen:
			n.freeze()
			n.freeze_everyone()

func melt_everyone():
	for n in neighbors:
		if n.actually_frozen:
			n.melt()
			n.melt_everyone()

func _on_area_2d_body_entered(body):
	if body.name == "Player":
		freeze_source = true
		freeze_everyone()


func _on_area_2d_body_exited(body):
	if body.name == "Player":
		freeze_source = false
		melt_everyone()


func _on_neighbor_check_body_entered(body):
	if neighbors.find(body.owner) == -1:
		neighbors.append(body.owner)
