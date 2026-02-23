extends CharacterBody2D

const SPEED = 60.0
const JUMP_VELOCITY = -100.0


func _physics_process(delta: float) -> void:
	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("ui_left", "ui_right")
	
	if direction:
		velocity.x = direction * SPEED
		
		if direction > 0:
			$AnimatedSprite2D.play("andando_frente")
			$AnimatedSprite2D.flip_h = false
		else:
			$AnimatedSprite2D.play("andando_tras")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		$AnimatedSprite2D.play("parado")

	move_and_slide()
