extends RigidBody2D

var tracking = false
var startPos = Vector2()
var kickDir = Vector2()
var bird_pos : Vector2
var intial_hit = false
#var gravity_scale = 0

func _ready():
	#mode = RigidBody2D.MODE_KINEMATIC
	pass


func _input(evt):
	if( evt is InputEventMouseButton and evt.button_index == MOUSE_BUTTON_LEFT):
		if(evt.is_pressed()):
			tracking = true
			startPos = evt.position
			#$FishTile080.position = evt.position
		else:
			tracking = false
			intial_hit = true
			#TODO:
			#set a varible kickDir to the difference between startPos and evt.position
			kickDir = (startPos-evt.position)
			print(kickDir)
						
			#set gravity_scale to 1
			gravity_scale = 1
			apply_force(kickDir*300)
			
			$"../particle/boom".position = $".".position
			$"../particle/boom".emitting = true
			

			#apply a force in the kickDr direction * 300
		

func _process(delta: float) -> void:
	if intial_hit == true:
		#after first hit ya gotta make that tracer veiwable
		$"../particle/tracer".position =  $".".position
		$"../particle/tracer".emitting = true
	
	pass

	
