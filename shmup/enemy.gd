extends RigidBody2D
@export var txtScore : Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var onlyForScore = get_node("/root/Node2D")
	var stolenScore = onlyForScore.returnScore()
	linear_velocity.y = (15*(0.8*stolenScore))


func _on_body_shape_entered(body_rid: RID, body: Node, body_shape_index: int, local_shape_index: int) -> void:
	#if body.name == "Player" or body.name == "Bullet" or body.name == "bullet":
	if body.name != "enemy":
		var game_controller = get_node("/root/Node2D")
		game_controller.CheckAndCreateBoost()
		game_controller.incrementScore()
		body.queue_free()
		self.queue_free()
	pass # Replace with function body.
