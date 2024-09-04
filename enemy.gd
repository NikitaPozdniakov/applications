extends Area2D

@export var speed = 50
@export var bullet_scene : PackedScene

func _ready():
	$Timer.wait_time = randf_range(1, 3)
	$Timer.start()

func _process(delta):
	position.y += speed *delta
	
func explode():
	queue_free()
	

func _on_timer_timeout():
	var b = bullet_scene.instantiate()
	get_tree().root.add_child(b)
	b.start(position + Vector2(0, 8))
	$Timer.wait_time = randf_range(1, 3)
	
