extends Node

var window_health: float = 100.0
var difficulty: float = 1.0
var depth: int = 0

func intensity_calc() -> float:
	var intensity = difficulty * (float(depth)/1000)
	return intensity
