extends Node2D

var enemy = preload("res://enemy.tscn")

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_timer_timeout():
	var enemy = enemy.instantiate()
	enemy.position.x =  rng.randf_range(10.0, 1000.0)#may change later
	enemy.position.y = -15
	enemy.set_name("enemy")
	get_node("/root/Node2D").add_child(enemy)#SpaceShooterGame
	pass # Replace with function body.
