extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (String) var UP_EVENT = "ui_up"
export (String) var DOWN_EVENT = "ui_down"
onready var SPEED = 10


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed(UP_EVENT):
		position.y += SPEED
	if Input.is_action_pressed(DOWN_EVENT):
		position.y -= SPEED
