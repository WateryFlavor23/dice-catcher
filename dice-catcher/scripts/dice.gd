class_name Dice
extends Area2D

@onready var sprite_2d: Sprite2D = %Sprite2D
@export var speed: float = 200.00

const ROTATION_SPEED: float = 2 * PI

var rotation_direction: float = pow(-1, randi_range(0,1))

func _physics_process(delta: float) -> void:
	position.y += speed * delta
	sprite_2d.rotate(rotation_direction * ROTATION_SPEED * delta)
