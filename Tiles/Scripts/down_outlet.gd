extends StaticBody2D
class_name Outlet

var is_on = false
var finished_flowing = true
var waters: Array
var nextWater = preload("res://Tiles/flowingWater.tscn")
var nextWaterPos = 0
@onready var nextFlowCheck = get_node("Areas/FlowDirection")
@onready var areas = get_node("Areas")
@onready var spawnTimer = get_node("SpawnTimer")
@onready var despawnTimer = get_node("DespawnTimer")


func _process(delta):
	if is_on:
		water_flow()
	else:
		if not waters.is_empty():
			finished_flowing = false
			if spawnTimer.is_stopped():
				spawnTimer.start()
		else:
			finished_flowing = true
			areas.position = Vector2.ZERO


func water_flow():
	if next_tile_check():
		finished_flowing = false
		if spawnTimer.is_stopped():
			spawnTimer.start()
	else:
		spawnTimer.stop()
		finished_flowing = true


func next_tile_check() -> int:
	var nextTile = nextFlowCheck.get_overlapping_bodies().filter(is_static_body)
	nextWaterPos = nextTile.is_empty()
	return nextWaterPos


func is_static_body(node: Node2D):
	return node is StaticBody2D or TileMap


func _on_spawn_timer_timeout():
	if is_on:
		var nextTemp = nextWater.instantiate()
		areas.position.y += 32
		nextTemp.position = areas.position
		add_child(nextTemp)
		waters.append(nextTemp)
	else:
		waters.pop_front().full_free()
