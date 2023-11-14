extends RigidBody2D

var frozen = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	check_ice()
	if frozen:
		sleeping = true
	else:
		sleeping = false

func check_ice():
	var overlapps = get_node("Area2D").get_overlapping_bodies()
	for n in overlapps:
		if n is Water and n.actually_frozen:
			frozen = true
			return
	frozen = false
