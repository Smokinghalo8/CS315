extends Node2D

@export var rockScene = preload("res://rock.tscn")

var rng = RandomNumberGenerator.new()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func plane_hit():

	$Timer.stop()
	$GameOver.visible=true
	$GameOver/AnimationPlayer.play("slide in")
	$sfx/thud.play()


func _on_timer_timeout() -> void:
	var motherRock = rockScene.instantiate()

	var tempInteger = rng.randf_range(0,1)
	if tempInteger <=.5:

		print("Going through timeout, below .5")
		motherRock.position.y=650
		#motherRock.x=600
		self.add_child(motherRock)

	else:
		print("Going through timeout, above .5 or anything else")
		motherRock.position.y=250
		self.add_child(motherRock)
		#motherRock.x=100
	pass # Replace with function body.
			#get_node("/root/Node2D").add_child(Bullet)



func _on_button_pressed() -> void:
	$Timer.start()
	$Plane.position.x=0
	$Plane.position.y=0
	$GameOver.visible=false
