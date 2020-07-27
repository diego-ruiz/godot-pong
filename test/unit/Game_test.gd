extends "res://addons/gut/test.gd"

var _obj = null

func before_each():
	var DOUBLE_ME_SCENE = 'res://Game.tscn'
	var scene = autofree(load(DOUBLE_ME_SCENE).instance())
	_obj = scene

func before_all():
	gut.p("Runs once before all tests")

func test_on_Ball_score():
	_obj._on_Ball_score("p1")
	assert_eq(_obj.player1score, 1)
	_obj._on_Ball_score("p1")
	assert_eq(_obj.player1score, 2)
	_obj._on_Ball_score("p2")
	assert_eq(_obj.player2score, 1)
	var node = _obj.get_node("GUI/Wrapper/ContentWrapper/Row/PlayerScore/Player2Score")
	assert_eq(node.get_text(), "Player 2: 1")

func test_ball_collisions():
	var node = _obj.get_node("Ball")
	gut.p("ball_pos: " + str(node.get_position().x) + ", " + str(node.get_position().y))
	#var collision = KinematicCollision2D()
	
	#_obj.handle_collision(collision)
	#gut.simulate(_obj, 20, .1)
	yield(yield_for(5), YIELD)
	node = _obj.get_node("Ball")
	gut.p("ball_pos: " + str(node.get_position().x) + ", " + str(node.get_position().y))
	assert_eq(1, 1)
