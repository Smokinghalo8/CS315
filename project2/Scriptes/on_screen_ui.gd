extends CanvasLayer

class_name on_screenUI

@onready var right_hand_slot: onScreenEquipmentSlot = $MarginContainer/HBoxContainer/right_hand_slot

var slots_directory = {
	"Right_hand": right_hand_slot
}

func equip_item(item: InventoryItem, slot_to_equip: String):
	slots_directory[slot_to_equip].set_equipment_texture(item.texure)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
