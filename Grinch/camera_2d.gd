extends Camera2D

var initial_camera_x = 942
var initial_camera_y = 544
var camera_unlocked = false

func _ready():
	top_level = true # This sets the camera to not be affected by its parent movement
	global_position = Vector2(initial_camera_x, initial_camera_y) # Sets the position of the camera to initial values

func _physics_process(delta):
	if Global_Variables.grinch_position.x >= 650:
		if not camera_unlocked:
			initial_camera_x = global_position.x # Storing initial camera position right when grinch_position passes 650
			camera_unlocked = true
		
		# Move the camera with the player's x position, maintaining the initial offset
		global_position.x = initial_camera_x + (Global_Variables.grinch_position.x - 650)
