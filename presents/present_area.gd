extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_entered(area: Area2D) -> void:
	if area.name == "Grinch_Area":
		Global_Variables.presents_collected += 1
		if Global_Variables.presents_collected >= Global_Variables.all_presents:
			print("You win!")
		print(Global_Variables.presents_collected)
		get_parent().queue_free()
		
