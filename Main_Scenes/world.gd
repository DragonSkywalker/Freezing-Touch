extends Node2D


func _ready():
	var children = get_node("MyTileMap").get_children()
	for n in children:
		print(n.name)
	
