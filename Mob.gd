extends CharacterBody3D

signal squashed

@export var min_speed = 10
@export var max_speed = 18

func _physics_process(delta):
	move_and_slide()
	
func initialize(start_pos, player_pos):
	# random speed
	var random_speed = randi_range(min_speed, max_speed)
	velocity = Vector3.FORWARD * random_speed
	position.y = 50
	
	# adjust velocity toward player, with some randomness
	look_at_from_position(start_pos, player_pos, Vector3.UP)
	rotate_y(randf_range(-PI/4, PI/4))
	velocity = velocity.rotated(Vector3.UP, rotation.y)



func _on_visible_on_screen_notifier_3d_screen_exited():
	queue_free()

func squash():
	squashed.emit()
	queue_free()
