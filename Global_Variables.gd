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
		
		get_tree().paused = true # Pausing the game for dramatic effect

		var audio_player = AudioStreamPlayer.new()
		audio_player.process_mode = Node.PROCESS_MODE_ALWAYS # Setting the process to ALWAYS so that it runs even when the game is paused
		add_child(audio_player)
		audio_player.stream = load("res://Temp_Assets/WilhelmScream.mp3")
		audio_player.play()
		await get_tree().create_timer(1.3).timeout # Waiting for scream to finish
		
		get_tree().change_scene_to_file("res://Scenes/caught_screen.tscn")
		get_tree().paused = false # Unpausing the game

signal presents_value_changed(num_presents)
var _presents_collected = 0 # Dependent on how many presents you have
var presents_collected: int: # Signals whenever presents_collected changes value
	get:
		return _presents_collected
	set(value):
		if _presents_collected != value:
			_presents_collected = value
			presents_value_changed.emit(value)

var all_presents = 3 # Determines how many presents are needed to win
func you_win():
	get_tree().change_scene_to_file("res://Scenes/victory_screen.tscn")
