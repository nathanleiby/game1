extends Node

# allow assigning mob.tscn or any monster
@export var mob_scene: PackedScene


func _ready():
	$UserInterface/Retry.hide()

func _on_timer_timeout():
	var mob = mob_scene.instantiate()
	
	var mob_spawn_location = get_node("SpawnPath/SpawnLocation")
	mob_spawn_location.progress_ratio = randf() # TODO: does this exist?
	
	var player_position = $Player.position
	
	mob.initialize(mob_spawn_location.position, player_position)
	
	add_child(mob)

	mob.squashed.connect($UserInterface/ScoreLabel._on_mob_squashed.bind())	

func _on_player_hit():	
	$MobTimer.stop()
	$UserInterface/Retry.show()
	
func _unhandled_input(event):
	if event.is_action_pressed("ui_accept") and $UserInterface/Retry.visible:
		# restart the current scene
		get_tree().reload_current_scene()
