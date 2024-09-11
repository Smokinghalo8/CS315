extends RigidBody2D



#now the part where we ended on was:
#Add an export resource variable, name it "bullet resource"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.linear_velocity.y = -2000
	 # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
