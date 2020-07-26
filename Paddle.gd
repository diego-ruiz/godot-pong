extends KinematicBody2D


export (String) var UP_EVENT = "ui_up"
export (String) var DOWN_EVENT = "ui_down"
onready var SPEED = 300
var velocity = Vector2()

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed(UP_EVENT):
		velocity.y -= 1
	if Input.is_action_pressed(DOWN_EVENT):
		velocity.y += 1
	velocity = velocity.normalized() * SPEED
func _physics_process(delta):
	get_input()
	move_and_collide(velocity * delta)
