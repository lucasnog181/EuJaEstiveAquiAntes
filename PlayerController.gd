extends KinematicBody2D


export var gravity = 10
export var walk_speed = 200
export var jump_speed = -200
var movement = Vector2(0,0)

func _physics_process(delta):
	# Movimentação
	if is_on_ceiling():
		movement.y = 0
		
	if !is_on_floor():
		movement.y += gravity
	else:
		movement.y = gravity
		
	var horizontal_axis = Input.get_action_strength("right") - Input.get_action_strength("left")
	movement.x = walk_speed * horizontal_axis
	
	# Jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		movement.y = jump_speed
		
	move_and_slide(movement, Vector2.UP)


func _on_AreaL3_area_entered(area):
	if area.is_in_group("ChaveDg"):
		print("pegou")
		add_to_group("DgKey")
