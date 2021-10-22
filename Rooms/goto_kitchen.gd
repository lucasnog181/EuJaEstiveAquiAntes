extends Area2D


func _on_goto_kitchen_body_entered(body):
	get_tree().change_scene("res://Rooms/Hall3.tscn")
