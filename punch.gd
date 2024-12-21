extends Node2D

@export var punch_range = 10.0
@export var punch_cooldown = 0.5
var punch_timer: Timer
var punch_layer = 1


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	punch_timer = Timer.new()
	punch_timer.one_shot = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func punch():
	if punch_timer.time_left == 0: #ensure punch isn't on cooldown
		%AnimatedSprite2D.play("punch")
		punch_timer.start(punch_cooldown) #start cooldown
		
		var hitbox = Rect2(    #create hitbox
			global_position.x - punch_range / 2,
			global_position.y - punch_range / 2,
			punch_range,
			punch_range
		)
		
		var space_state = get_world_2d().direct_space_state
		var result = space_state.intersect_area(
			hitbox,
			punch_layer
		)
		
		for collision in result: #check to see if anything was hit
			if collision.collider.has_method("get_punched"):
				collision.collider.get_punched() #call get_punched elf script to handle getting punched
		
		
		
