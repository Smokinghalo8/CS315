extends Area2D

@export var playerInside: bool = false



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.sssss




func _on_body_entered(body: Node2D) -> void:
	$npcSpeak2.visible=true
	pass # Replace with function body.


func _on_body_exited(body: Node2D) -> void:
	$npcSpeak2.visible=false
	pass # Replace with function body.
