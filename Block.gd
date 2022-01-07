extends StaticBody2D

export (Texture) var blueBlock;
export (Texture) var greenBlock;
export (Texture) var yellowBlock;
export (Texture) var pinkBlock;

export (int) var strength; 

# Called when the node enters the scene tree for the first time.
func _ready():
	updateSprite()
	pass
	
func hit():
	strength -= 1
	if (strength <= 0):
		queue_free()
	else:
		updateSprite()
	pass
	
func updateSprite():
	match (strength):
		3: 
			$Sprite.texture = yellowBlock
		2:
			$Sprite.texture = greenBlock
		1:
			$Sprite.texture = blueBlock
		_:
			$Sprite.texture = pinkBlock
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
