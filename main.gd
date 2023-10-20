extends Node

# allow assigning mob.tscn or any monster
@export var mob_scene: PackedScene



func _on_timer_timeout():
	var mob = mob_scene.instantiate()
	
	var mob_spawn_location = get_node("SpawnPath/SpawnLocation")
	mob_spawn_location.progress_ratio = randf() # TODO: does this exist?
	
	var player_position = $Player.position
	
	mob.initialize(mob_spawn_location.position, player_position)
	
	add_child(mob)
	
