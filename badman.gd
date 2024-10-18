extends CharacterBody2D

@onready var health_bar = $ProgressBar

var health =5


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func hit(hit_dir):
	self.velocity = hit_dir.normalized() *1000
	health-=1
	health_bar.value = health
	if health<=0:
		self.queue_free()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	velocity *=.9
	move_and_slide()
	pass
