extends Area2D

@export var playerInside: bool = false



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("enter") && playerInside==true:
		$"../sfx/characterNoise".play()
		get_tree().change_scene_to_file("res://Scenes/mainalt.tscn")

	pass


func _on_body_entered(body: Node2D) -> void:
	$eggBoySpeak.visible=true
	playerInside=true
	pass # Replace with function body.


func _on_body_exited(body: Node2D) -> void:
	$eggBoySpeak.visible=false
	playerInside=false
	pass # Replace with function body.
