extends KinematicBody2D

export var speed = 100.0

# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var directionVector = Vector2.ZERO
	if Input.is_action_pressed("ui_left"):
		directionVector = Vector2.LEFT
	elif Input.is_action_pressed("ui_right"):
		directionVector = Vector2.RIGHT
	
	var speedVector = directionVector * speed
	
	move_and_collide(speedVector * delta)
	pass
