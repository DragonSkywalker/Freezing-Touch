extends StaticBody2D

var is_on = false
var finished_flowing = true
var waters: Array
var nextWater = preload("res://Tiles/flowingWater.tscn")
@onready var nextFlowCheck = get_node("FlowDirection")

func _process(delta):
#	print("is_on: " + str(is_on))
#	print("finished_flowing: " + str(finished_flowing))
	if is_on:
		var nextTile = nextFlowCheck.get_overlapping_bodies().filter(is_static_body)
		if nextTile.is_empty():
			finished_flowing = false
			var nextTemp = nextWater.instantiate()
			nextFlowCheck.position.y += 32
			nextTemp.position = nextFlowCheck.position
			add_child(nextTemp)
			waters.append(nextTemp)
		else:
			finished_flowing = true
	else:
		if not waters.is_empty():
			finished_flowing = false
			waters.pop_front().full_free()
		else:
			finished_flowing = true
			nextFlowCheck.position = Vector2.ZERO

func _on_button_pressed():
	if finished_flowing:
		is_on = not is_on

func is_static_body(node: Node2D):
	return node is StaticBody2D
