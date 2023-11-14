extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Panel").text = str(Utils.level)
