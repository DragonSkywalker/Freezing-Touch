extends Water

#func _process(_delta):
#	print(actually_frozen)

func full_free():
	for n in neighbors:
		if is_instance_valid(n):
			n.neighbors.erase(self)
	queue_free()

func _on_neighbor_check_body_entered(body):
	if body is Water:
		if neighbors.find(body) == -1:
			neighbors.append(body)
			if body.neighbors.find(self) == -1:
				body.neighbors.append(self)

