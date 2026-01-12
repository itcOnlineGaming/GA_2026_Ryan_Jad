extends Node

@export var mob_scene: PackedScene
var score
var round_number = 0
var round_start_time = 0.0
var current_speed = 400

func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	$HUD.show_game_over()
	$Music.stop()
	$DeathSound.play()
	
	# Calculate survival time for this round
	var survival_time = Time.get_ticks_msec() - round_start_time
	survival_time = survival_time / 1000.0  # Convert to seconds
	
	# Save stats to CSV
	save_round_stats(current_speed, survival_time, score)


func new_game():
	get_tree().call_group(&"mobs", &"queue_free")
	score = 0
	round_number += 1
	
	# Randomize player speed (coin toss between 600 and 400)
	$Player.randomize_speed()
	current_speed = $Player.speed
	
	$Player.start($StartPosition.position)
	$StartTimer.start()
	$HUD.update_score(score)
	$HUD.show_message("Get Ready")
	$Music.play()
	
	# Record the start time of this round
	round_start_time = Time.get_ticks_msec()


func _on_MobTimer_timeout():
	# Create a new instance of the Mob scene.
	var mob = mob_scene.instantiate()

	# Choose a random location on Path2D.
	var mob_spawn_location = get_node(^"MobPath/MobSpawnLocation")
	mob_spawn_location.progress = randi()

	# Set the mob's position to a random location.
	mob.position = mob_spawn_location.position

	# Set the mob's direction perpendicular to the path direction.
	var direction = mob_spawn_location.rotation + PI / 2

	# Add some randomness to the direction.
	direction += randf_range(-PI / 4, PI / 4)
	mob.rotation = direction

	# Choose the velocity for the mob.
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	mob.linear_velocity = velocity.rotated(direction)

	# Spawn the mob by adding it to the Main scene.
	add_child(mob)


func _on_ScoreTimer_timeout():
	score += 1
	$HUD.update_score(score)


func _on_StartTimer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()

func save_round_stats(speed: float, survival_time: float, score: int):
	var csv_file_path = "user://round_stats.csv"
	
	# Check if file exists by trying to read it
	var file_content = ""
	var file_exists = FileAccess.file_exists(csv_file_path)
	
	if file_exists:
		file_content = FileAccess.get_file_as_string(csv_file_path)
	
	# Now open in WRITE mode and write everything back
	var file = FileAccess.open(csv_file_path, FileAccess.WRITE)
	
	if file == null:
		push_error("Error opening CSV file: ", FileAccess.get_open_error())
		return
	
	# If this is a new file, write header
	if not file_exists:
		file.store_line("Round,Speed,Survival_Time_Seconds,Score")
	else:
		# Write back the existing content
		file.store_string(file_content)
	
	# Append the new round data
	var csv_line = "%d,%.1f,%.2f,%d" % [round_number, speed, survival_time, score]
	file.store_line(csv_line)
	
	print("Round stats saved - Round: %d, Speed: %.1f, Survival Time: %.2f seconds, Score: %d" % [round_number, speed, survival_time, score])
