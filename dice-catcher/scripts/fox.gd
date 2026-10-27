class_name Fox
extends Area2D

@export var speed: float = 300.00
@onready var sprite: Sprite2D = %Sprite
@onready var scores: AudioStreamPlayer2D = %Scores

signal eat


func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_right"):
		position.x = clamp(position.x + speed * delta, 50, 1100)
		sprite.flip_h = true
		
	if Input.is_action_pressed("ui_left"):
		position.x = clamp(position.x - speed * delta, 50, 1100)
		sprite.flip_h = false


func _on_area_entered(area: Area2D) -> void:
	emit_signal("eat")
	scores.play()
	area.queue_free()
