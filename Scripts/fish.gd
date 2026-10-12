extends Resource
class_name Fish

@export var model: PackedScene
@export var avoid_animation: Animation
@export var attack_animation: Animation
@export var jumpscare_animation: Animation
@export var damage: int
@export var attack_chance: float
@export var hull_attack_chance: float

func _init() -> void:
	pass 
