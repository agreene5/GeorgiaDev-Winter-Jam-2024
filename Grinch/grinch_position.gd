extends Node2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Global_Variables.grinch_position = get_parent().position # Setting the grinch's position to the global variable every delta
