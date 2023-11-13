class_name Valve
extends StaticBody2D

var is_on = true

func _process(delta):
	var outlet = get_parent().get_node_or_null("Outlet")
	if outlet:
		outlet.is_on = is_on
		print(outlet.is_on)
