extends KinematicBody2D

var velocity = Vector2()
var SPEED = 400
onready var paddle_width = 7
onready var ball_width = 7
signal score

func _ready():
	velocity.y -= 1
	velocity.x -= 1
	velocity = velocity.normalized() * SPEED

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	#print("process fire " + str(velocity.x) + ", " + str(velocity.y))
	if collision:
		#print("I collided with ", collision.collider.name)
		handle_collision(collision)
			
func handle_collision(collision):
	if collision.collider.name == "boundaries":
		velocity.y *= -1
	elif collision.collider.name == "Paddle":
		var ball_col = position.x - ball_width
		var paddle_col = collision.collider.position.x + paddle_width
		#print("process collide " + str(ball_col) + ", " + str(paddle_col))
		if ball_col > paddle_col:
			velocity.x *= -1
		else:
			velocity.y *= -1
	elif collision.collider.name == "Paddle2":
		var ball_col = position.x + ball_width
		var paddle_col = collision.collider.position.x - paddle_width
		#print("process collide " + str(ball_col) + ", " + str(paddle_col))
		if ball_col < paddle_col:
			velocity.x *= -1
		else:
			velocity.y *= -1
	elif collision.collider.name == "p1goal":
		emit_signal("score", "p2")
		position.x = 512
		position.y = 320
	elif collision.collider.name == "p2goal":
		emit_signal("score", "p1")
		position.x = 512
		position.y = 320
