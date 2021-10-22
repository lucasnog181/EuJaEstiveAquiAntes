extends Area2D


func _on_goto_hall2_body_entered(body):
	get_tree().change_scene("res://Rooms/Hall2.tscn")
