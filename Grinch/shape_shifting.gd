extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("right_click"): # Shape Shift
		if Global_Variables.current_form == 0: # Turning into Santa
			%Grinch_Sprite.modulate = Color(1.0, 0.0, 0.0) # Turning sprite deep red (Placeholder till Santa sprite is done)
			Global_Variables.current_form = 1
			print("Santa Time")
		else: # Turning into Grinch
			%Grinch_Sprite.modulate = Color(1.0, 1.0, 1.0) # Turning sprite back to normal
			Global_Variables.current_form = 0
			print("Grinch Time")
