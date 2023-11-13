extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -620.0
const PUSH_FORCE = 80.0
var is_on_valve = false
var valve

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		if is_on_valve:
			valve.is_on = not valve.is_on
			position.x = valve.position.x
			print(valve.is_on)
		else:
			velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		get_node("Sprite2D").flip_h = direction - 1
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	for i in get_slide_collision_count():
		var c = get_slide_collision(i)
		if c.get_collider() is RigidBody2D:
			c.get_collider().apply_central_impulse(-c.get_normal() * PUSH_FORCE)


func _on_valve_detection_body_entered(body):
	var tempValve = body as Valve
	if tempValve:
		valve = body
		is_on_valve = true


func _on_valve_detection_body_exited(body):
	var tempValve = body as Valve
	if tempValve:
		is_on_valve = false
