extends Node2D

enum SlingState{
	idle,
	pulling,
	birdThrown,
	reset
}

var SlingShotState
var leftLine
var rightLine

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SlingShotState=SlingState.idle
	leftLine=$Left_line
	rightLine=$Right_line
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	match SlingShotState:
		SlingState.idle:
			pass
		SlingState.pulling:
			if Input.is_action_pressed("left_mouse"):
				var distance = get_global_mouse_position()
				print(distance)
				if distance.distance_to($AutoRacingBlackBox_svg.position) > 100:
					distance = (distance - $AutoRacingBlackBox_svg.position).normalized() * 100 + $AutoRacingBlackBox_svg.position
				leftLine.points[1] = distance
				rightLine.points[1] = distance
			else:
				var location = get_global_mouse_position()
				var distance = location.distance_to($AutoRacingBlackBox_svg.position)
				var velocity = $AutoRacingBlackBox_svg.position - location
				var player = get_tree().get_nodes_in_group("Player")[0]
				player.ThrowBird()
				player = player as RigidBody2D
				player.apply_inpulse(Vector2(),velocity)
				
				Ui.CurrentGameState = Ui.GameState.Play
		SlingState.birdThrown:
			pass
		SlingState.reset:
			pass
	pass


func _on_touch_area_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if SlingShotState == SlingState.idle:
		if(event is InputEventMouseButton && event.is_pressed()):
			SlingShotState = SlingState.pulling
	
	pass # Replace with function body.
