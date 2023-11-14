extends StaticBody2D

var is_on = false
var finished_flowing = true
var waters: Array
var nextWater = preload("res://Tiles/flowingWater.tscn")
@onready var nextFlowCheck = get_node("FlowDirection")
@onready var spawnTimer = get_node("SpawnTimer")
@onready var despawnTimer = get_node("DespawnTimer")


func _process(delta):
#	print("is_on: " + str(is_on))
#	print("finished_flowing: " + str(finished_flowing))

	if is_on:
		var nextSpace = nextFlowCheck.get_overlapping_bodies()
		var nextTile = nextSpace.filter(is_static_body)
		if nextTile.is_empty():
			finished_flowing = false
			if spawnTimer.is_stopped():
				spawnTimer.start()
		else:
			spawnTimer.stop()
			finished_flowing = true
	else:
		if not waters.is_empty():
			finished_flowing = false
			if spawnTimer.is_stopped():
				spawnTimer.start()
		else:
			finished_flowing = true
			nextFlowCheck.position = Vector2.ZERO

func is_static_body(node: Node2D):
	return node is StaticBody2D


func _on_spawn_timer_timeout():
	if is_on:
		var nextTemp = nextWater.instantiate()
		nextFlowCheck.position.y += 32
		nextTemp.position = nextFlowCheck.position
		add_child(nextTemp)
		waters.append(nextTemp)
	else:
		waters.pop_front().full_free()
