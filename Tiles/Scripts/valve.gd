class_name Valve
extends StaticBody2D

var is_on = true
@onready var animation = get_node("Sprite2D")
@onready var outlet = get_parent().get_node_or_null("Outlet")

func _process(delta):
	if outlet:
		outlet.is_on = is_on

func activate(player: Node):
	player.position.x = position.x
	if is_on:
		is_on = false
		animation.play_backwards("Spin")
		player.get_node("Sprite2D").flip_h = false
		player.get_node("Sprite2D").play("Spin")
	else:
		is_on = true
		animation.play("Spin")
		player.get_node("Sprite2D").flip_h = false
		player.get_node("Sprite2D").play_backwards("Spin")
