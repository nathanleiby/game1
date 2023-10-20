extends CharacterBody3D

@export var speed = 14
@export var fall_acceleration = 75
@export var jump_impulse = 20
@export var bounce_impulse = 16

var target_velocity = Vector3.ZERO

func _physics_process(delta):
	var direction = Vector3.ZERO
	
	# NOTE: In 3d, the xz plane is the ground plane
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_back"):
		direction.z += 1
	if Input.is_action_pressed("move_forward"):
		direction.z -= 1
		
	# Jumping
	if is_on_floor() and Input.is_action_pressed("jump"):
		target_velocity.y = jump_impulse
		
	# collisions
	for index in range(get_slide_collision_count()):
		var collision = get_slide_collision(index)
		
		# if it's a collision with the ground
		if collision.get_collider() == null:
			continue
		
		if collision.get_collider().is_in_group("mob"):
			var mob = collision.get_collider()
			# check that we are colliding from above
			print("Collision normal:", collision.get_normal(), " ---> UP dot product = ", Vector3.UP.dot(collision.get_normal()))
			if Vector3.UP.dot(collision.get_normal()) > 0.75: # TODO: was 0.1 in example
				mob.squash()
				target_velocity.y = bounce_impulse	
			
		
	if direction != Vector3.ZERO:
		direction = direction.normalized()
		$Pivot.look_at(position + direction, Vector3.UP)

	# Ground Velocity
	target_velocity.x = direction.x * speed
	target_velocity.z = direction.z * speed
	
	# Vertical Velocity
	if not is_on_floor(): # if in air, fall. gravity!
		target_velocity.y = target_velocity.y - (fall_acceleration * delta)
	
	# Moving
	velocity = target_velocity
	move_and_slide()
	
