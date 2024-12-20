extends Resource

class_name InventoryItem

var stacks = 1

@export_enum("Right_hand", "Left_hand","Potions","Non-equipable")#only adding right_hand for now
var slot_type: String = "NotEquipable"

@export var ground_collsion_shape: RectangleShape2D
@export var name: String = ""
@export var texture: Texture2D
@export var side_texture: Texture2D
@export var max_stacks: int
@export var price: int
