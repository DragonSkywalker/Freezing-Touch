extends Outlet

@onready var gravityCheck = get_node("Areas/Gravity")
const LEFT = 1
const DOWN = -1

func next_tile_check() -> int:
	nextWaterPos = DOWN
	var nextTile = gravityCheck.get_overlapping_bodies().filter(is_static_body)
	if (areas.position == Vector2.ZERO) or (not nextTile.is_empty()):
		if not nextTile.filter(is_water).is_empty():
			return 0
		nextWaterPos = LEFT
		nextTile = nextFlowCheck.get_overlapping_bodies().filter(is_static_body)
	nextWaterPos *= int(nextTile.is_empty())
	return nextWaterPos


func is_water(node: Node2D):
	return node is Water


func _on_spawn_timer_timeout():
	if is_on:
		var nextTemp = nextWater.instantiate()
		if nextWaterPos == DOWN:
			nextTemp.get_node("Sprite").rotation = PI / 2
			areas.position.y += 32
		elif nextWaterPos ==LEFT:
			nextTemp.get_node("Sprite").flip_h = true
			areas.position.x -= 32
		else:
			print(nextWaterPos)
			get_tree().quit()
		nextTemp.position = areas.position
		add_child(nextTemp)
		waters.append(nextTemp)
	else:
		waters.pop_front().full_free()
