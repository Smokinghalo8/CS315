extends Node

class_name inventory
@onready var inventory_ui: inventoryUI = $"../inventory_ui"

@export var items: Array[InventoryItem] = [] #dexscribes items in inventory

func checkCoins():
	pass



func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("toggleInv"):
		inventory_ui.toggle()
		
		
func add_item(item: InventoryItem, stacks: int):
	if stacks && item.max_stacks > 1:
		add_stackable_item_to_inventory(item, stacks)
	else:
		items.append(item)
		inventory_ui.add_item(item)

func add_stackable_item_to_inventory(item: InventoryItem, stacks: int):
	#item is stacks in inventory, we need to pick the next slot, we do this, by look in reverse order in invenory for empty slots
	var item_index = -1
	for i in items.size():
		if items[i] != null and items[i].name == item.name:
			item_index = i
	if item_index != -1:
		#add stacks to found item
		var inventory_item = items[item_index]
		#check to see if we can add stack
		if inventory_item.stacks + stacks <= item.max_stacks:
			inventory_item.stacks +=stacks
			items[item_index] = inventory_item
			inventory_ui.update_stack_at_slot_index(inventory_item.stacks, item_index)
		else:
			var stacks_diff = inventory_item.stacks + stacks - item.max_stacks
			var additional_inventory_item = inventory_item.duplicate(true)
			inventory_item.stacks = item.max_stacks
			inventory_ui.update_stack_at_slot_index(inventory_item.max_stacks, item_index)
			additional_inventory_item.stacks = stacks_diff
			items.append(additional_inventory_item)
			inventory_ui.add_item(additional_inventory_item)
	else:
		item.stacks = stacks
		items.append(item)
		inventory_ui.add_item(item)
		

	pass
