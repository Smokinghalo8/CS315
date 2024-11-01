extends Area2D

class_name PickUpItemKey

@export var inventory_item: InventoryItem

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

@export var stacks: int = 1
@export var keyPickUp: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#sprite_2d.texture = inventory_item.texture
	#collision_shape_2d.shape = inventory_item.ground_collision_shape Fix this
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
