extends Node2D

@onready var timer = $Timer
var time = 180.0  # 3 minute timer till Christmas Eve

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global_Variables.caught = false # Setting the caught to false for this scene is reloaded 
	Global_Variables.presents_collected = 0 # Settings presents to 0 everytime scene reloads
	
	timer.wait_time = time # Setting wait time to the timer value
	timer.one_shot = true # Timer won't repeat when it hits 0
	timer.timeout.connect(_on_timer_timeout)
	timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
		time = timer.time_left

func _on_timer_timeout() -> void: # Called when timer hits 0
		time = 0.0
		print("It's Christmas Eve! You Lose!")
		Global_Variables.got_caught()
