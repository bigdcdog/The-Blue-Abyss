extends Resource
class_name Fish

@export var model: PackedScene

@export var avoid_animation: Animation
@export var attack_animation: Animation
@export var jumpscare_animation: Animation

@export var base_damage: float
@export var base_attack_chance: float

@export var current_damage: float
@export var current_attack_chance: float

@export var hull_attack_chance: float

func set_stats():
	current_damage = min(base_damage * global.difficulty * global.intensity, 100.0)
	current_attack_chance = min(base_attack_chance * global.difficulty * global.intensity, 1.0)

func _init() -> void:
	set_stats().call_deferred()
