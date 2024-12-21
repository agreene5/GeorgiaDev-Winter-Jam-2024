extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(3.0).timeout # Wait 3 seconds before switching back to the main scene
	get_tree().change_scene_to_file("res://Scenes/main.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
