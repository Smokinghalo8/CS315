extends CharacterBody2D
@export var bulletScence = preload("res://bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("leftArrow"):
		self.position.x-=3
	if Input.is_action_pressed("rightArrow"):
		self.position.x+=3
	if Input.is_action_pressed("upArrow"):
		self.position.y-=3
	if Input.is_action_pressed("downArrow"):
		self.position.y+=3
	if Input.is_action_just_pressed("shoot"):
		var Bullet = bulletScence.instantiate()
		Bullet.position.x = self.position.x+20
		Bullet.position.y = self.position.y
		Bullet.set_name("Bullet")
		get_node("/root/Node2D").add_child(Bullet)
		#The increment is going up with each enemny shot, but for some reason, enemies spawned using
		#enemySpawner aren't changing state?
	
#instantiate
#global_position 

	#self.bulletScence.position.y +=5
	#I actually dont think this one was used
func shoot(playerX, playerY):
	var Bullet = bulletScence.instantiate()
	get_node("/root/Node2D").add_child(Bullet)
	#position bulletScene at wherever the ship is
	Bullet.position.x = playerX+10
	Bullet.position.y = playerY
