extends Node2D

const fullText = [
	"Thank you for \nvolunteering for \nour experimental \ndrugs?",
	"you got the \nsuperpower of \nfreezing any \nliquid you touch?",
	"The pill at the \nend of the \nchambers removes \nyour power?",
	"I would take it \nif i were you?",
	"To you know... \nNot die to \ndehydration?",
	"Anyway.\nbest of luck!?"
	]
@onready var t = get_node("Text/Text")
@onready var timer = get_node("Timer")
var texting = true
var i = 0
var j = 0
var char

func _ready():
	Utils.texting = true

func _process(_delta):
	if not texting:
		timer.stop()
	if Input.is_action_just_pressed("ui_accept"):
		i += 1
		if i >= 6:
			Utils.texting = false
			queue_free()
		t.text = ""
		j = 0
		texting = true
		timer.start()


func _on_timer_timeout():
	var c = fullText[i][j]
	if c == '?':
		texting = false
	else:
		t.text += c
	j += 1
