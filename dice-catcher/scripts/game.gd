extends Node

const DICE: PackedScene = preload("res://scenes/dice.tscn")
const GAME_OVER = preload("res://assets/game_over.wav")

@onready var spawn_timer: Timer = %SpawnTimer
@onready var game_score: Label = %GameScore
@onready var music_bg: AudioStreamPlayer = %MusicBg
@onready var death_timer: Timer = %DeathTimer
@onready var game_over: Label = %GameOver

var score: int = 0


func _on_spawn_timer_timeout() -> void:
	var instance: Dice = DICE.instantiate()
	if spawn_timer.wait_time > 1.5:
		spawn_timer.wait_time -= 0.1
	
	add_child(instance)
	instance.position = Vector2(randi_range(50, 1100),-50.00)


func _on_fox_eat() -> void:
	score += 1
	game_score.text = "%03d" % score


func _on_kill_zone_area_entered(area: Area2D) -> void:
	area.queue_free()
	
	game_over.visible = true
	
	music_bg.stop()
	music_bg.stream = GAME_OVER
	music_bg.play()
	
	death_timer.start()
	
	get_tree().paused = true
	

func _on_death_timer_timeout() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
