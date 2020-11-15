extends KinematicBody2D


func _process(delta: float) -> void:
	
	var motion_vector = Vector2()
	
	if (Input.is_action_pressed("ui_up")):
		motion_vector.y -= 1
	if (Input.is_action_pressed("ui_down")):
		motion_vector.y += 1
	if (Input.is_action_pressed("ui_left")):
		motion_vector.x -= 1
	if (Input.is_action_pressed("ui_right")):
		motion_vector.x += 1
	
	self.move_and_collide(motion_vector * delta * 200)



func on_impostor_sabotage_lights(var on):
	var T = $LightSizeTween
	
	if on:
		T.interpolate_property($Light2D, "texture_scale", 1.0, 0.15, 4, Tween.TRANS_LINEAR)
	else:
		T.interpolate_property($Light2D, "texture_scale", 0.15, 1.0, 4, Tween.TRANS_LINEAR)
	T.start()
