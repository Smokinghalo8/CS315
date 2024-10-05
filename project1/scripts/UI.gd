extends Control

#TODO: Add a expert_var for fish object to spawn
#TODO: Add a class property for score

var score = 0




func add_score():
	#increase score
	score+=1
	#show new score on page
	$Label.text=("Eat thouse mf fish!! Fish Ate: "+str(score))
	
	#if score is at max - return to main page
	if score==6:
		#$"../sfx/winner.wav".play()#fix
		get_tree().change_scene_to_file("res://gameObjects/winner.tscn")
	pass




# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	pass
