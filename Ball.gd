extends KinematicBody2D

var velocity = Vector2()
onready var SPEED = 400
onready var paddle_width = 8
onready var ball_width = 8
func _ready():
	velocity.y -= 1
	velocity.x -= 1
	velocity = velocity.normalized() * SPEED

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		#print("I collided with ", collision.collider.name)
		if collision.collider.name == "boundaries":
			velocity.y *= -1
		elif collision.collider.name == "Paddle":
			if position.x - ball_width > collision.collider.position.x + paddle_width:
				velocity.x *= -1
			else:
				velocity.y *= -1
		elif collision.collider.name == "Paddle2":
			if position.x + ball_width < collision.collider.position.x - paddle_width:
				velocity.x *= -1
			else:
				velocity.y *= -1
		elif collision.collider.name == "p1goal":
			position.x = 512
			position.y = 320
		elif collision.collider.name == "p2goal":
			position.x = 512
			position.y = 320
