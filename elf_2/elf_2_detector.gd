extends Area2D

var grinch_visible = false
var santa_timer = 5.0

func _ready() -> void:
	# Connect to the current_form_changed signal
	Global_Variables.current_form_changed.connect(_on_current_form_changed)

func _process(delta: float) -> void:
	if Global_Variables.grinch_visible:
		if Global_Variables.current_form == 0:
				Global_Variables.got_caught()
		else:
			if Global_Variables.is_santa:
				print("It's Santa!")
				Global_Variables.is_santa = true
			
			santa_timer -= delta
			if santa_timer <= 0:
				Global_Variables.got_caught()
				Global_Variables.is_santa = false

func _on_area_entered(area: Area2D) -> void:
	if area.name == "Grinch_Area":
		Global_Variables.grinch_visible = true

func _on_area_exited(area: Area2D) -> void:
	if area.name == "Grinch_Area":
		Global_Variables.grinch_visible = false
		Global_Variables.is_santa = false
		santa_timer = 5.0

func _on_current_form_changed(new_form: int) -> void:
	Global_Variables.is_santa = false
	santa_timer = 5.0
