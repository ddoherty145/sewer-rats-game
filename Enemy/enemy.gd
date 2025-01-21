extends CharacterBody2D

@export var movement_speed = 20.0

# Enemy detects the Player
@onready var player = get_tree().get_first_node_in_group("Player")

func _physics_process(_delta):
	# Check if the player exists before trying to get its position
	if player:
		# Calculate the direction vector from the enemy to the player
		var direction = global_position.direction_to(player.global_position)
		# Update the velocity based on the direction and movement speed
		var velocity = direction * movement_speed
		# Move the enemy towards the player
		move_and_collide(velocity * _delta)
