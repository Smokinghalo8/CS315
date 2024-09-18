extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("flap"):
		print("clicked")
		apply_force(Vector2(0,-15000))#I dont know what Vector2 does anymore
		$AnimatedSprite2D.animation = "flap"


func _on_animated_sprite_2d_animation_finished() -> void:
	if $AnimatedSprite2D.animation=="flap":
		$AnimatedSprite2D.animation="glide"
	pass # Replace with function body.
