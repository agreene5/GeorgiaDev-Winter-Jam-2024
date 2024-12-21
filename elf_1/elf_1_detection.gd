extends Area2D

var grinch_visible = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if grinch_visible == true:
		if Global_Variables.current_form == 0:
			print("Grinch Detected!")
		else:
			print("It's Santa!")


func _on_area_entered(area: Area2D) -> void:
	if area.name == "Grinch_Area":
		grinch_visible = true

func _on_area_exited(area: Area2D) -> void:
	if area.name == "Grinch_Area":
		grinch_visible = false
