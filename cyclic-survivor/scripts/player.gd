extends CharacterBody2D

@export var movement_speed : float = 12000
var character_direction : Vector2

func _physics_process(delta):

	character_direction.x = Input.get_axis("gameplay_a", "gameplay_d")
	character_direction.y = Input.get_axis("gameplay_w", "gameplay_s")
	character_direction = character_direction.normalized()
	
	if character_direction:
		velocity = character_direction * movement_speed * delta
	else:
		velocity = velocity.move_toward(Vector2.ZERO, movement_speed)
	
	move_and_slide()
