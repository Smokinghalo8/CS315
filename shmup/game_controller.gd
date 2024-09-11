extends Node2D

var score=0
@export var txtScore : Label
@export var Player : CharacterBody2D
@export var EnemySpawner : Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func incrementScore():
	score+=1
	var tempText = str(score)
	$scoreLabel.text = tempText
	
func CheckAndCreateBoost():
	var tempText = str(score)
	if score>=20:
		#maybe drop something on the battlefield?
		$scoreLabel.text = tempText +" Woah, you got 20! Nice job! Maybe Ill give you a cookie or something!"
	
func returnScore():
	return score
	
func game_over():	#Friend put this in here, If the character player is gone, delete everything from screen
	if(Player==null):
		Player.queue_free()
		EnemySpawner.queue_free()
