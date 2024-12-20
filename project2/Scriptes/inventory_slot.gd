extends VBoxContainer

class_name InventorySlot

var is_empty = true
var is_selected = false

@export var single_button_press = false
@export var starting_texture: Texture
@export var start_label: String

@onready var texture_rect: TextureRect = $NinePatchRect/MenuButton/CenterContainer/TextureRect
@onready var name_label: Label = $nameLabel
@onready var stacks_label: Label = $NinePatchRect/onClickButton/StacksLabel
@onready var on_click_button: Button = $NinePatchRect/onClickButton
@onready var price_label: Label = $PriceLabel
@onready var menu_button: MenuButton = $NinePatchRect/MenuButton


var slot_to_equip = "Non-equipable"




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if starting_texture != null:
		texture_rect.texture = starting_texture
	if start_label != null:
		name_label.text = start_label
	
	menu_button.disabled = single_button_press
	on_click_button.disabled = !single_button_press
	
	on_click_button.visible = single_button_press
	
	var popup_menu = menu_button.get_popup()
	popup_menu.id_pressed.connect(on_popup_menu_item_pressed)
	
	pass # Replace with function body.


func on_popup_menu_item_pressed(id: int):
	print_debug(id)
	
func add_item(item: InventoryItem):
	if item.slot_type != "Non-equipable":
		var popup_menu = menu_button.get_popup()
		var equip_slot_name_array = item.slot_type.to_lower().split("_")
		var equip_slot_name = " ".join(equip_slot_name_array)
		slot_to_equip = item.slot_type
		popup_menu.set_item_text(0, "Equip to "+ equip_slot_name)
		
	is_empty = false
	menu_button.disabled = false
	texture_rect.texture = item.texture
	name_label.text = item.name
	if item.stacks < 2:
		return
	stacks_label.text = str(item.stacks)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
