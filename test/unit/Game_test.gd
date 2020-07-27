extends "res://addons/gut/test.gd"

func before_all():
	gut.p("Runs once before all tests")
	
func test_assert_eq_number_equal():
	assert_eq('asdf', 'asdf', "Should pass")
