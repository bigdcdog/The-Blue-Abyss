extends Resource
class_name Fish

@export var model: PackedScene

@export var avoid_animation: Animation
@export var hull_attack_animation: Animation
@export var window_attack_animation: Animation
@export var jumpscare_animation: Animation

var played_animation: Animation

@export var base_time: float
@export var base_damage: float

var current_time: float
var current_damage: float

@export var hull_attack_chance: float

@export var condition: Array[int] = [0, 0, 0, 0, 0]

func set_stats():
	var intensity = global.intensity_calc()
	current_time = max(base_time / intensity, 0.1)
	current_damage = min(base_damage * intensity, 100.0)

func broken_window() -> Animation: #if window breaks
	if current_damage < global.window_health:
		global.window_health -= current_damage
		return window_attack_animation
	return jumpscare_animation

func HorW() -> Animation: #hull or window
	if randf() > hull_attack_chance:
		return broken_window()
	return hull_attack_animation

func AHW() -> Animation: #Avoid, Hull or Window
	if condition == global.condition:
		return avoid_animation
	return HorW()

func initialise(node: Node) -> Animation:
	set_stats().call_deferred()
	await node.get_tree().create_timer(current_time).timeout
	return AHW()
