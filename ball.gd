extends KinematicBody2D


export var speedVector = Vector2(100.0,-100.0)
export var maxSpeed = 215


# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var collision = move_and_collide(speedVector * delta)
	
	if collision:
		print('Speed: ' + str(speedVector.length()) + ' collider: ' + collision.collider.name)
		if(collision.collider.name == 'Racket'):
			var racket = collision.collider
			var distance = racket.position.x - position.x
			var width = racket.get_node('Sprite').texture.get_width()
			var angleRad = -deg2rad(45*distance/(width/2))
			
			var minAngle = deg2rad(10)
			angleRad = clamp(angleRad, -1*minAngle, minAngle)
			
			speedVector = speedVector.bounce(collision.normal).rotated(angleRad)
			
			speedVector = speedVector*1.01
			if (speedVector.length()>maxSpeed): # force max speed
				speedVector = maxSpeed/speedVector.length()*speedVector
		elif ('Block' in collision.collider.name):
			collision.collider.hit()
			speedVector = speedVector.bounce(collision.normal)
		else:
			speedVector = speedVector.bounce(collision.normal)
	pass


func _on_VisibilityNotifier2D_screen_exited():
	get_tree().reload_current_scene()
