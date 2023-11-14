extends Node

var level

const SAVE_PATH = "res://Global/save.bin"

func _ready():
	loadGame()

func saveGame(lvl: int):
	level = lvl
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	var jstr = JSON.stringify(lvl)
	file.store_line(jstr)

func loadGame():
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)	
	if FileAccess.file_exists(SAVE_PATH):
		if not file.eof_reached():
			var current_line = JSON.parse_string(file.get_line())
			if current_line:
				level = int(current_line)
