extends CharacterBody2D

@export var min_speed = 150
@export var max_speed = 300
var speed : float
var move_direction = Vector2.LEFT # Moving to the left
var flip_timer = 0
var is_flipped = false
var cooldown_timer = 0

func _ready():
	speed = randf_range(min_speed, max_speed) # Gives the elf a random speed between the set range

func _physics_process(delta):
	if Global_Variables.grinch_visible == false:
		if flip_timer > 0:
			flip_timer -= delta
			if flip_timer <= 0:
				reset_movement()
		
		if cooldown_timer > 0:
			cooldown_timer -= delta

		velocity = move_direction * speed
		
		move_and_slide() # Moves grinch and handles collisions
		
		# Check for nearby elves
		for elf in get_tree().get_nodes_in_group("Elves"):
			if elf != self:  # Don't let elf detect itself
				var distance = global_position.distance_to(elf.global_position)
				if distance < 300 and not is_flipped and cooldown_timer <= 0:
					flip_and_reverse()
					break  # Exit the loop after flipping once
		
		# Check if object is 1000 units to the left of the grinch
		var distance_x = global_position.x - Global_Variables.grinch_position.x
		
		# If further than 1000 units to the left (negative distance), it'll despawn
		if distance_x < -1000:
			print("Despawning")
			queue_free()

func flip_and_reverse():
	scale.x = -scale.x  # Flip horizontally
	move_direction = -move_direction  # Reverse direction
	is_flipped = true
	flip_timer = 5.0  # Move in opposite direction for 5 seconds

func reset_movement():
	if is_flipped:
		scale.x = -scale.x  # Flip back
		move_direction = -move_direction  # Reverse direction back to original
		is_flipped = false
		cooldown_timer = 2.0  # Have a 2 second cooldown
