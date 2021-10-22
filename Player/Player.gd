extends KinematicBody2D


var walk_speed = 200
var movement = Vector2(0,0)
var last_movement = "right"


func update_animations():
	if movement.x < 0:
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("side_walk")
		last_movement = "right"
	elif movement.x > 0:
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("side_walk")	
		last_movement = "left"
	elif movement.y > 0:
		$AnimatedSprite.play("down_walk")
		last_movement = "down"
	elif movement.y < 0:
		$AnimatedSprite.play("up_walk")
		last_movement = "up"
	else:
		if last_movement == "right":
			$AnimatedSprite.flip_h = false
			$AnimatedSprite.play("side_idle")
		elif last_movement == "left":
			$AnimatedSprite.flip_h = true
			$AnimatedSprite.play("side_idle")
		elif last_movement == "down":
			$AnimatedSprite.play("down_idle")
		elif last_movement == "up":
			$AnimatedSprite.play("up_idle")

func _physics_process(delta):
	var horizontal_axis = Input.get_action_strength("right") - Input.get_action_strength("left")
	movement.x = walk_speed * horizontal_axis
	var vertical_axis = Input.get_action_strength("down") - Input.get_action_strength("up")
	movement.y = walk_speed * vertical_axis

	move_and_slide(movement, Vector2.UP)
	update_animations()
