extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global_Variables.caught = false # Setting the caught to false for this scene is reloaded 
	Global_Variables.presents_collected = 0 # Settings presents to 0 everytime scene reloads


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
