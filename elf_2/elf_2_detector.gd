extends Area2D

var grinch_visible = false
var santa_timer = 5.0
var is_santa = false

func _ready() -> void:
	# Connect to the current_form_changed signal
	Global_Variables.current_form_changed.connect(_on_current_form_changed)

func _process(delta: float) -> void:
	if grinch_visible:
		if Global_Variables.current_form == 0:
				print("Grinch Detected!")
		else:
			if is_santa:
				print("It's Santa!")
				is_santa = true
			
			santa_timer -= delta
			if santa_timer <= 0:
				print("That's not santa!")
				is_santa = false

func _on_area_entered(area: Area2D) -> void:
	if area.name == "Grinch_Area":
		grinch_visible = true

func _on_area_exited(area: Area2D) -> void:
	if area.name == "Grinch_Area":
		grinch_visible = false
		is_santa = false
		santa_timer = 5.0

func _on_current_form_changed(new_form: int) -> void:
	is_santa = false
	santa_timer = 5.0
