# For Global Variables
extends Node

signal current_form_changed(new_form)
var _current_form = 0 # Value dependent on whether you're in grinch or santa form
					 # 0 = Grinch | 1 = Santa
var current_form: int: # Signals whenever current_form changes value
	get:
		return _current_form
	set(value):
		if _current_form != value:
			_current_form = value
			current_form_changed.emit(value)

var caught = false
func got_caught():
	if caught == false:
		caught = true
		get_tree().change_scene_to_file("res://Scenes/caught_screen.tscn")
