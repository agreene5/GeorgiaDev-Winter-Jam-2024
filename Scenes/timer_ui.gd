extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var time_remaining = owner.time # Getting the current time
	
	# Convert 180 seconds to 6 hours (1 second = 2 minutes of clock time)
	var total_minutes = (180.0 - time_remaining) * 2  # Convert to clock minutes
	
	# Calculate hours and minutes
	var hours = int(floor(total_minutes / 60))  # Get hours passed
	var minutes = int(floor(total_minutes)) % 60  # Get remaining minutes
	
	# Start at 12 and add hours passed
	var display_hour = (12 + int(hours)) % 12
	if display_hour == 0:
		display_hour = 12
	
	# Determine AM/PM
	var meridiem = "PM"
	if hours >= 6:
			meridiem = "AM"
	
	# Outputted time text
	text = "%d:%02d %s" % [display_hour, minutes, meridiem]
