extends Node

var player1score = 0
var player2score = 0

func _on_Ball_score(player):
	if(player == "p1"):
		var node = get_node("GUI/Wrapper/ContentWrapper/Row/PlayerScore/Player1Score")
		player1score += 1
		if(node):
			node.set_text("Player 1: " + str(player1score))
	if(player == "p2"):
		var node = get_node("GUI/Wrapper/ContentWrapper/Row/PlayerScore/Player2Score")
		player2score += 1
		if(node):
			node.set_text("Player 2: " + str(player2score))
