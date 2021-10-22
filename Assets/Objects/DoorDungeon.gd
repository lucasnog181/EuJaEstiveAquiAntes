extends StaticBody2D

var DoorOpen = 0

func _process(delta):
	if DoorOpen == 1:
		$CollisionShape2D.disabled = true
func _on_Area2D_body_entered(body):
	if body.is_in_group("DgKey"):
		print("Porta do calabouço aberta!")
		$AnimatedSprite.play("opening")
		DoorOpen = 1
