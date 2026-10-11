extends Node

var radar_points: Array[Vector2] = []

func _ready() -> void:
	radar_points.append(Vector2(0.1, 0.4))
	radar_points.append(Vector2(0.7, 0.8))
