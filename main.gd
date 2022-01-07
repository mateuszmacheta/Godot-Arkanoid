extends Node2D

var blockCounter = 0;


# Called when the node enters the scene tree for the first time.
func _ready():
	blockCounter = self.get_node("Level1/Blocks").get_child_count()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	blockCounter = self.get_node("Level1/Blocks").get_child_count()
	print(blockCounter)
	if (blockCounter <= 0):
		$Racket.speed = 0
		$Ball.speedVector = Vector2.ZERO
		$WinMessage.show()
	pass
