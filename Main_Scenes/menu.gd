extends Node2D



func _on_start_pressed():
	var level_path = "res://Main_Scenes/Levels/Level" + str(Utils.level) + ".tscn"
	if Utils.level >= 7 or get_tree().change_scene_to_file(level_path) == ERR_CANT_OPEN:
		get_tree().change_scene_to_file("res://Main_Scenes/Levels/Level1.tscn")


func _on_quit_pressed():
	get_tree().quit()


func _on_levels_pressed():
	get_tree().change_scene_to_file("res://Main_Scenes/level_selection.tscn")
