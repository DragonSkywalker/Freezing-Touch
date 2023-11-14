extends Node2D


func _ready():
	for i in Utils.level:
		var n = get_node_or_null(str(i + 1))
		if n:
			n.get_node("Lock").visible = false

func _on_button1_pressed():
	get_tree().change_scene_to_file("res://Main_Scenes/Levels/Level1.tscn")


func _on_button2_pressed():
	if Utils.level >= 2:
		get_tree().change_scene_to_file("res://Main_Scenes/Levels/Level2.tscn")



func _on_button3_pressed():
	if Utils.level >= 3:
		get_tree().change_scene_to_file("res://Main_Scenes/Levels/Level3.tscn")



func _on_button4_pressed():
	if Utils.level >= 4:
		get_tree().change_scene_to_file("res://Main_Scenes/Levels/Level4.tscn")



func _on_button5_button_up():
	if Utils.level >= 5:
		get_tree().change_scene_to_file("res://Main_Scenes/Levels/Level5.tscn")



func _on_button6_pressed():
	if Utils.level >= 6:
		get_tree().change_scene_to_file("res://Main_Scenes/Levels/Level6.tscn")

