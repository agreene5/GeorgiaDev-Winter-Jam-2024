extends Label

signal presents_value_changed(num_presents)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
		Global_Variables.presents_value_changed.connect(_on_presents_value_changed)
		# Set initial text
		text = "Presents: %d/%d" % [Global_Variables.presents_collected, Global_Variables.all_presents]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
		pass

func _on_presents_value_changed(new_form: int) -> void: # Runs every time present value changes and updates values
		print("udpateeded")
		text = "Presents: %d/%d" % [Global_Variables.presents_collected, Global_Variables.all_presents]
