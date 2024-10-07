extends CharacterBody2D

@export var SPEED = 300.0

@onready var sprite : AnimatedSprite2D = $'miku-animatedSprite'

func _physics_process(delta: float) -> void:
	move(delta)
	
	move_and_slide()


func move(delta : float):
	var direction : Vector2 = Input.get_vector("left", "right", "forward", "backward")
	self.velocity = direction * SPEED
	changeAnimation(direction)
	
func changeAnimation(direction : Vector2):
	if(direction == Vector2(-1, 0)):
		sprite.flip_h = true
		if(not sprite.is_playing()):
			sprite.play("run")
	if(direction == Vector2(1, 0)):
		sprite.flip_h = false
		if(not sprite.is_playing()):
			sprite.play("run")
	if(direction == Vector2(0, -1)):
		pass
	if(direction == Vector2(0, 1)):
		pass
	if(direction == Vector2.ZERO):
		sprite.stop()
