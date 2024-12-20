extends Area2D

@export var speed = 400
var screen_size


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_left"): #moving left
		velocity.x -= 1
	if Input.is_action_pressed("move_right"): #moving right
		velocity.x += 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play("walk")
	else:
		$AnimatedSprite2D.stop()
		
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size) #keep grinch in the scene
