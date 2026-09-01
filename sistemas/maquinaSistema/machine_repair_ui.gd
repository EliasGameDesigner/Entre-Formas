extends CanvasLayer
class_name MachineRepairUI

# Referência da máquina atual que está sendo consertada
var current_machine: Node2D = null

# Lista de slots instanciados na UI
var slot_nodes: Array[RepairSlot] = []

# Guarda itens temporariamente alocados nos slots (slot_index -> ItemData)
var slotted_items: Dictionary = {}

# SFX para feedback tátil de encaixe e conclusão
const SFX_SNAP = preload("res://Audios/litupsubway-key-collect-sfx-522219.mp3")

# Referências de nós na árvore de cena
@onready var control_root: Control = $Control
@onready var dim_bg: ColorRect = $Control/DimBackground
@onready var main_panel: PanelContainer = $Control/MainPanel
@onready var machine_title_label: Label = $Control/MainPanel/MarginContainer/VBoxContainer/Header/TitleLabel
@onready var close_button: Button = $Control/MainPanel/MarginContainer/VBoxContainer/Header/CloseButton
@onready var formula_label: Label = $Control/MainPanel/MarginContainer/VBoxContainer/BlueprintContainer/FormulaLabel
@onready var repair_image_rect: TextureRect = $Control/MainPanel/MarginContainer/VBoxContainer/BlueprintContainer/HBox/BlueprintRect
@onready var slots_container: HBoxContainer = $Control/MainPanel/MarginContainer/VBoxContainer/BlueprintContainer/HBox/SlotsContainer
@onready var status_label: Label = $Control/MainPanel/MarginContainer/VBoxContainer/ActionContainer/StatusLabel
@onready var cost_label: Label = $Control/MainPanel/MarginContainer/VBoxContainer/ActionContainer/CostLabel
@onready var repair_button: Button = $Control/MainPanel/MarginContainer/VBoxContainer/ActionContainer/RepairButton

# Inventário Horizontal Inferior
@onready var bottom_panel: PanelContainer = $Control/BottomInventoryPanel
@onready var inventory_items_container: HBoxContainer = $Control/BottomInventoryPanel/MarginContainer/VBoxContainer/ScrollContainer/InventoryHBox
@onready var empty_inventory_label: Label = $Control/BottomInventoryPanel/MarginContainer/VBoxContainer/ScrollContainer/EmptyLabel

func _ready() -> void:
	# Oculta o menu ao iniciar o jogo
	hide()
	
	# Conexões de botões
	close_button.pressed.connect(close_ui)
	repair_button.pressed.connect(_on_repair_button_pressed)
	
	# Estilização inicial
	_setup_panel_styles()

func _setup_panel_styles() -> void:
	# Estilo do painel principal (Workbench de conserto)
	var panel_style = StyleBoxFlat.new()
	panel_style.bg_color = Color(0.08, 0.1, 0.15, 0.95)
	panel_style.border_width_bottom = 3
	panel_style.border_width_top = 3
	panel_style.border_width_left = 3
	panel_style.border_width_right = 3
	panel_style.border_color = Color(0.78, 0.58, 0.28, 0.9) # Dourado / Cobre
	panel_style.corner_radius_bottom_left = 12
	panel_style.corner_radius_bottom_right = 12
	panel_style.corner_radius_top_left = 12
	panel_style.corner_radius_top_right = 12
	panel_style.shadow_size = 10
	panel_style.shadow_color = Color(0, 0, 0, 0.6)
	main_panel.add_theme_stylebox_override("panel", panel_style)

	# Estilo do painel de inventário inferior
	var bottom_style = StyleBoxFlat.new()
	bottom_style.bg_color = Color(0.07, 0.09, 0.13, 0.95)
	bottom_style.border_width_bottom = 2
	bottom_style.border_width_top = 2
	bottom_style.border_width_left = 2
	bottom_style.border_width_right = 2
	bottom_style.border_color = Color(0.3, 0.5, 0.75, 0.85) # Azul suave
	bottom_style.corner_radius_bottom_left = 10
	bottom_style.corner_radius_bottom_right = 10
	bottom_style.corner_radius_top_left = 10
	bottom_style.corner_radius_top_right = 10
	bottom_style.shadow_size = 8
	bottom_style.shadow_color = Color(0, 0, 0, 0.5)
	bottom_panel.add_theme_stylebox_override("panel", bottom_style)

func open_ui(machine: Node2D) -> void:
	current_machine = machine
	slotted_items.clear()
	
	if not InventoryManager.inventory_changed.is_connected(_refresh_horizontal_inventory):
		InventoryManager.inventory_changed.connect(_refresh_horizontal_inventory)
		
	_populate_machine_info()
	_create_repair_slots()
	_refresh_horizontal_inventory()
	_update_repair_status()
	
	show()

func close_ui() -> void:
	# Devolve qualquer item alocado temporariamente nos slots de volta ao inventário
	_refund_slotted_items()
	
	if InventoryManager.inventory_changed.is_connected(_refresh_horizontal_inventory):
		InventoryManager.inventory_changed.disconnect(_refresh_horizontal_inventory)
		
	current_machine = null
	slotted_items.clear()
	hide()

func _unhandled_input(event: InputEvent) -> void:
	if not visible:
		return
		
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_ESCAPE or event.physical_keycode == KEY_ESCAPE:
			close_ui()
			get_viewport().set_input_as_handled()
		elif event.keycode == KEY_E or event.physical_keycode == KEY_E:
			close_ui()
			get_viewport().set_input_as_handled()

func _populate_machine_info() -> void:
	if current_machine == null or current_machine.machine_data == null:
		return
		
	var data: MachineData = current_machine.machine_data
	machine_title_label.text = "🔧 REPARAR: " + data.machine_name.to_upper()
	
	# Imagem de montagem / molde
	if data.repair_image != null:
		repair_image_rect.texture = data.repair_image
		repair_image_rect.show()
	else:
		repair_image_rect.hide()
		
	# Mensagem de pedagogia e fórmula geométrica
	formula_label.text = _get_pedagogical_formula_text(data)

func _get_pedagogical_formula_text(data: MachineData) -> String:
	var name_lower = data.machine_name.to_lower()
	if "quadrado" in name_lower:
		return "📐 Geometria: Quadrado (Área = L²)
💡 Dica: Arraste 2 Triângulos para recompor a matriz geométrica do Quadrado!"
	elif "retangulo" in name_lower or "retângulo" in name_lower:
		return "📐 Geometria: Retângulo (Área = Base × Altura)
💡 Dica: Arraste 2 Quadrados para formar a estrutura do Retângulo!"
	elif "triangulo" in name_lower or "triângulo" in name_lower:
		return "📐 Geometria: Triângulo (Área = (Base × Altura) / 2)
💡 Dica: Encaixe as peças para recalibrar os ângulos da máquina!"
	else:
		return "📐 Matriz de Manutenção Geométrica
💡 Arraste e solte as peças necessárias para consertar a máquina."

func _create_repair_slots() -> void:
	# Limpa slots anteriores
	for child in slots_container.get_children():
		child.queue_free()
	slot_nodes.clear()
	
	if current_machine == null or current_machine.machine_data == null:
		return
		
	var required: Array[ItemData] = current_machine.machine_data.required_items
	
	# Se a máquina não tiver peças cadastradas na lista
	if required.is_empty():
		var empty_lbl = Label.new()
		empty_lbl.text = "Esta máquina não necessita de peças sobressalentes."
		empty_lbl.modulate = Color(0.7, 0.8, 0.9)
		slots_container.add_child(empty_lbl)
		return
		
	for i in range(required.size()):
		var req_item = required[i]
		var slot = _instantiate_repair_slot(req_item, i)
		slots_container.add_child(slot)
		slot_nodes.append(slot)

func _instantiate_repair_slot(req_item: ItemData, idx: int) -> RepairSlot:
	var slot = RepairSlot.new()
	slot.name = "Slot_" + str(idx)
	
	# Estrutura interna do slot
	var vbox = VBoxContainer.new()
	vbox.name = "VBoxContainer"
	vbox.alignment = BoxContainer.ALIGNMENT_CENTER
	vbox.add_theme_constant_override("separation", 6)
	
	var header_lbl = Label.new()
	header_lbl.text = "PEÇA " + str(idx + 1)
	header_lbl.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	header_lbl.add_theme_font_size_override("font_size", 11)
	header_lbl.modulate = Color(0.75, 0.85, 1.0, 0.8)
	vbox.add_child(header_lbl)
	
	var center = CenterContainer.new()
	center.name = "CenterContainer"
	var icon = TextureRect.new()
	icon.name = "IconRect"
	icon.custom_minimum_size = Vector2(56, 56)
	icon.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	icon.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	center.add_child(icon)
	vbox.add_child(center)
	
	var name_lbl = Label.new()
	name_lbl.name = "NameLabel"
	name_lbl.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	name_lbl.add_theme_font_size_override("font_size", 12)
	vbox.add_child(name_lbl)
	
	var status_lbl = Label.new()
	status_lbl.name = "StatusLabel"
	status_lbl.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	status_lbl.add_theme_font_size_override("font_size", 11)
	vbox.add_child(status_lbl)
	
	slot.add_child(vbox)
	
	slot.item_slotted.connect(_on_slot_item_slotted)
	slot.item_unslotted.connect(_on_slot_item_unslotted)
	slot.setup(req_item, idx)
	return slot

func _refresh_horizontal_inventory() -> void:
	for child in inventory_items_container.get_children():
		child.queue_free()
		
	var all_items = InventoryManager.get_all_items()
	
	if all_items.is_empty():
		empty_inventory_label.show()
		return
	else:
		empty_inventory_label.hide()
		
	for item in all_items:
		var qty = all_items[item]
		if qty > 0:
			var card = _instantiate_inventory_drag_item(item, qty)
			inventory_items_container.add_child(card)

func _instantiate_inventory_drag_item(item: ItemData, count: int) -> InventoryDragItem:
	var drag_item = InventoryDragItem.new()
	drag_item.name = "InvItem_" + item.item_name
	
	var vbox = VBoxContainer.new()
	vbox.name = "VBoxContainer"
	vbox.alignment = BoxContainer.ALIGNMENT_CENTER
	vbox.add_theme_constant_override("separation", 4)
	
	var center = CenterContainer.new()
	center.name = "CenterContainer"
	var icon = TextureRect.new()
	icon.name = "IconRect"
	icon.custom_minimum_size = Vector2(44, 44)
	icon.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	icon.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	center.add_child(icon)
	vbox.add_child(center)
	
	var name_lbl = Label.new()
	name_lbl.name = "NameLabel"
	name_lbl.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	name_lbl.add_theme_font_size_override("font_size", 11)
	vbox.add_child(name_lbl)
	
	var qty_lbl = Label.new()
	qty_lbl.name = "QuantityLabel"
	qty_lbl.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	qty_lbl.add_theme_font_size_override("font_size", 11)
	qty_lbl.modulate = Color(1.0, 0.85, 0.3) # Dourado
	vbox.add_child(qty_lbl)
	
	drag_item.add_child(vbox)
	drag_item.item_clicked.connect(_on_inventory_item_clicked)
	drag_item.setup(item, count)
	return drag_item

func _on_inventory_item_clicked(item: ItemData) -> void:
	# Encontra o primeiro slot vazio que aceite este item e aloca
	for slot in slot_nodes:
		if slot.slotted_item == null and (slot.required_item == null or slot.required_item == item):
			slot.slot_piece(item)
			break

func _on_slot_item_slotted(slot_index: int, item: ItemData) -> void:
	# Remove 1 unidade do inventário e aloca temporariamente
	if InventoryManager.remove_item(item, 1):
		slotted_items[slot_index] = item
		AudioManager.play_sfx(SFX_SNAP)
		_update_repair_status()
		_refresh_horizontal_inventory()

func _on_slot_item_unslotted(slot_index: int, item: ItemData) -> void:
	# Devolve a peça de volta para o inventário
	if slotted_items.has(slot_index):
		slotted_items.erase(slot_index)
		InventoryManager.add_item(item, 1)
		AudioManager.play_sfx(SFX_SNAP)
		_update_repair_status()
		_refresh_horizontal_inventory()

func _refund_slotted_items() -> void:
	for slot_idx in slotted_items:
		var item: ItemData = slotted_items[slot_idx]
		if item != null:
			InventoryManager.add_item(item, 1)
	slotted_items.clear()

func _update_repair_status() -> void:
	if current_machine == null or current_machine.machine_data == null:
		return
		
	var data: MachineData = current_machine.machine_data
	var total_required_slots = slot_nodes.size()
	var filled_slots = slotted_items.size()
	
	var has_all_pieces = (filled_slots == total_required_slots)
	var has_enough_money = (InventoryManager.money >= data.repair_cash_cost)
	
	# Texto de peças
	status_label.text = "Peças Encaixadas: %d / %d" % [filled_slots, total_required_slots]
	if has_all_pieces:
		status_label.modulate = Color(0.3, 1.0, 0.4) # Verde
	else:
		status_label.modulate = Color(1.0, 0.8, 0.4) # Laranja
		
	# Texto de custo financeiro
	if data.repair_cash_cost > 0:
		cost_label.text = "Custo Adicional: $%d  (Seu Saldo: $%d)" % [data.repair_cash_cost, InventoryManager.money]
		if has_enough_money:
			cost_label.modulate = Color(0.8, 0.9, 1.0)
		else:
			cost_label.modulate = Color(1.0, 0.35, 0.35)
		cost_label.show()
	else:
		cost_label.hide()
		
	# Habilitação do botão de conserto
	if has_all_pieces and has_enough_money:
		repair_button.disabled = false
		repair_button.text = "✨ CONSERTAR MÁQUINA ✨"
		repair_button.modulate = Color(1.0, 1.0, 1.0, 1.0)
	else:
		repair_button.disabled = true
		if not has_all_pieces:
			repair_button.text = "Encaixe todas as peças..."
		else:
			repair_button.text = "Saldo insuficiente ($%d)" % data.repair_cash_cost
		repair_button.modulate = Color(0.7, 0.7, 0.7, 0.8)

func _on_repair_button_pressed() -> void:
	if current_machine == null or current_machine.machine_data == null:
		return
		
	var data: MachineData = current_machine.machine_data
	
	# Validação final de peças e saldo
	if slotted_items.size() < slot_nodes.size():
		GameUI.show_notification("Encaixe todas as peças necessárias primeiro!")
		return
		
	if InventoryManager.money < data.repair_cash_cost:
		GameUI.show_notification("Saldo insuficiente para pagar o custo de reparo!")
		return
		
	# Consome dinheiro se houver
	if data.repair_cash_cost > 0:
		InventoryManager.money -= data.repair_cash_cost
		
	# Os itens já foram debitados do inventário quando foram colocados nos slots,
	# então limpamos o dicionário temporário sem devolver
	slotted_items.clear()
	
	# Executa o conserto na máquina
	current_machine.repair_machine()
	AudioManager.play_sfx(SFX_SNAP)
	
	# Fecha o menu
	close_ui()
