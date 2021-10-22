extends StaticBody2D



func _on_AreaL3_area_entered(area):
	if area.is_in_group("Player"):
		print("playerentrou")
		queue_free()
