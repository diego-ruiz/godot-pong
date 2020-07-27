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
