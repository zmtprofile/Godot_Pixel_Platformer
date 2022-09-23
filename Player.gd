extends KinematicBody2D

var velocity = Vector2.ZERO

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	apply_gravity()
	var input = Vector2.ZERO
	input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	if input.x == 0:
		apply_friction()
	else:
		apply_acceleration(input.x)
	
	if is_on_floor() and Input.is_action_just_pressed("ui_up"):
		velocity.y = -120
		
	velocity = move_and_slide(velocity, Vector2.UP)
	
func apply_gravity():
	velocity.y += 4

func apply_friction():
	velocity.x = move_toward(velocity.x, 0, 10)

func apply_acceleration(amount):
	velocity.x = move_toward(velocity.x, 50 * amount, 10)
