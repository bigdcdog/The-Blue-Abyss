extends Camera3D

func _on_left_pressed() -> void:
	rotation_degrees.y = min(rotation_degrees.y + 15, 90)


func _on_right_pressed() -> void:
	rotation_degrees.y = max(rotation_degrees.y - 15, -90)
