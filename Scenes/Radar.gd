extends MeshInstance3D

const MAX_POINTS := 32

func _process(_delta: float) -> void:
	var material := get_active_material(0) as ShaderMaterial
	if material == null:
		return

	var points: Array[Vector2] = Global.radar_points
	var count := mini(points.size(), MAX_POINTS)

	material.set_shader_parameter("radar_points", points.slice(0, count))
	material.set_shader_parameter("point_count", count)
