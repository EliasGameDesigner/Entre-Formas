extends Node2D

## Controller da Cena de Tutorial — "Fantástica Fábrica de Formas".
## Gerencia todo o fluxo do tutorial orientado pela Art (a cartola mágica),
## aguardando ações reais do jogador utilizando os sinais e estados do jogo existente.

enum Step {
	NONE,
	INTRO,
	MOVEMENT_EXPLAIN,
	MOVEMENT_WAIT,
	MOVEMENT_CONFIRM,
	INTERACTION_EXPLAIN,
	INTERACTION_WAIT,
	INTERACTION_CONFIRM,
	MECHANIC_EXPLAIN,
	MECHANIC_WAIT,
	MECHANIC_CONFIRM,
	COLLECT_EXPLAIN,
	COLLECT_WAIT,
	COLLECT_CONFIRM,
	REPAIR_EXPLAIN,
	REPAIR_WAIT,
	REPAIR_CONFIRM,
	SELL_EXPLAIN,
	SELL_WAIT,
	SELL_CONFIRM,
	END_DIALOGUE,
	COMPLETED
}

const BALLOON_SCENE = preload("res://cenas/tutorial/tutorial_balloon.tscn")
const TRIANGLE_ITEM_DATA = preload("res://resources/itens/itemTriangulo.tres")
const WOOD_ITEM_DATA = preload("res://resources/itens/itemMadeira.tres")

var current_step: Step = Step.NONE
var dialogue_resource: Resource
var movement_accumulated: float = 0.0
var initial_item_count: int = 0
var initial_money: int = 0

# Referências de nós da cena
@onready var player: CharacterBody2D = $CharacterBody2D
@onready var maquina_quadrados: Node2D = $MaquinaQuadrados
@onready var maquina_triangulos: Node2D = $MaquinaTriangulos

# UI e Art criados dinamicamente
var art_node: Node2D
var controls_panel: PanelContainer
var controls_title: Label
var controls_text: Label
var tutorial_ui_layer: CanvasLayer


func _ready() -> void:
	print("[TUTORIAL] Inicializando cena de tutorial...")

	# Carrega o recurso de diálogo
	dialogue_resource = load("res://cenas/tutorial/tutorial_dialogue.dialogue")

	# Toca música ambiente relaxante
	var ambient_music = preload("res://Audios/ncone-soft-piano-loop-192098.mp3")
	if AudioManager:
		AudioManager.play_ambient(ambient_music)

	# Criação da Art (cartola mágica animada) e da UI de instruções
	_create_art_placeholder()
	_create_tutorial_ui()

	# Spawna peças triangulares no chão para a etapa de interação/coleta
	_spawn_triangle_items()

	# Configurações iniciais das máquinas no tutorial
	_configure_machines()

	# Conexões de sinais
	DialogueManager.dialogue_ended.connect(_on_dialogue_ended)
	InventoryManager.inventory_changed.connect(_on_inventory_changed)
	InventoryManager.money_changed.connect(_on_money_changed)

	# Conecta ao tabuleiro de montagem caso esteja disponível
	if RepairMenu and is_instance_valid(RepairMenu.assembly_board):
		RepairMenu.assembly_board.board_changed.connect(_on_board_changed)

	# Inicia o tutorial após 1 segundo
	await get_tree().create_timer(1.0).timeout
	_set_step(Step.INTRO)


func _process(delta: float) -> void:
	match current_step:
		Step.MOVEMENT_WAIT:
			# Detecta movimentação REAL do jogador (W A S D)
			if player and player.velocity.length() > 10.0:
				movement_accumulated += delta
				if movement_accumulated >= 1.5:
					_hide_controls()
					_set_step(Step.MOVEMENT_CONFIRM)

		Step.MECHANIC_WAIT:
			# Detecta montagem na bancada ou conclusão do conserto
			if maquina_quadrados and maquina_quadrados.current_state == 1:
				_hide_controls()
				_set_step(Step.MECHANIC_CONFIRM)
			elif RepairMenu and RepairMenu.visible and is_instance_valid(RepairMenu.assembly_board):
				if RepairMenu.assembly_board.get_total_slots() > 0 and RepairMenu.assembly_board.is_fully_assembled():
					_hide_controls()
					_set_step(Step.MECHANIC_CONFIRM)

		Step.REPAIR_WAIT:
			# Detecta conserto REAL da máquina (estado WORKING)
			if maquina_quadrados and maquina_quadrados.current_state == 1:
				_hide_controls()
				_set_step(Step.REPAIR_CONFIRM)


func _set_step(step: Step) -> void:
	current_step = step
	print("[TUTORIAL] Etapa atual: ", Step.keys()[step])

	match step:
		Step.INTRO:
			_show_dialogue("intro")

		Step.MOVEMENT_EXPLAIN:
			_show_controls("MOVIMENTO", "W   A   S   D")
			_show_dialogue("movement")

		Step.MOVEMENT_WAIT:
			movement_accumulated = 0.0

		Step.MOVEMENT_CONFIRM:
			_show_dialogue("movement_done")

		Step.INTERACTION_EXPLAIN:
			_show_controls("INTERAÇÃO", "MOUSE 1")
			initial_item_count = _count_inventory_items()
			_show_dialogue("interaction")

		Step.INTERACTION_WAIT:
			pass # Detectado via _on_inventory_changed

		Step.INTERACTION_CONFIRM:
			_show_dialogue("interaction_done")

		Step.MECHANIC_EXPLAIN:
			# Garante que o jogador tenha pelo menos 2 triângulos para montar o quadrado
			_ensure_required_pieces()
			_show_controls("MECÂNICA", "MOUSE 1 — CLIQUE E ARRASTE")
			_show_dialogue("mechanic")

		Step.MECHANIC_WAIT:
			# Se a máquina já foi consertada ou montada antes, avança
			if maquina_quadrados and maquina_quadrados.current_state == 1:
				_hide_controls()
				_set_step(Step.MECHANIC_CONFIRM)

		Step.MECHANIC_CONFIRM:
			_show_dialogue("mechanic_done")

		Step.COLLECT_EXPLAIN:
			_show_controls("COLETA DE RECURSOS", "MOUSE 1 — SEGURE NA ÁRVORE")
			initial_item_count = _count_inventory_items()
			_show_dialogue("collect")

		Step.COLLECT_WAIT:
			pass # Detectado via _on_inventory_changed

		Step.COLLECT_CONFIRM:
			_show_dialogue("collect_done")

		Step.REPAIR_EXPLAIN:
			# Se a máquina já estiver consertada, avança direto para a confirmação
			if maquina_quadrados and maquina_quadrados.current_state == 1:
				_set_step(Step.REPAIR_CONFIRM)
				return
			_show_controls("CONSERTO DA MÁQUINA", "MOUSE 1 — ATIVAR CONSERTO")
			_show_dialogue("repair")

		Step.REPAIR_WAIT:
			if maquina_quadrados and maquina_quadrados.current_state == 1:
				_hide_controls()
				_set_step(Step.REPAIR_CONFIRM)

		Step.REPAIR_CONFIRM:
			_show_dialogue("repair_done")

		Step.SELL_EXPLAIN:
			_show_controls("VENDA DE ITENS", "MOUSE 1 NO BALCÃO")
			initial_money = InventoryManager.money
			_ensure_sellable_items()
			_show_dialogue("sell")

		Step.SELL_WAIT:
			pass # Detectado via _on_money_changed

		Step.SELL_CONFIRM:
			_show_dialogue("sell_done")

		Step.END_DIALOGUE:
			_hide_controls()
			_show_dialogue("end_tutorial")

		Step.COMPLETED:
			_hide_controls()
			_cleanup_tutorial_state()
			print("[TUTORIAL] Tutorial finalizado com sucesso! Carregando cenario principal...")
			await get_tree().create_timer(2.0).timeout
			get_tree().change_scene_to_file("res://cenario.tscn")


func _on_dialogue_ended(resource: Resource) -> void:
	if resource != dialogue_resource:
		return

	match current_step:
		Step.INTRO:
			_set_step(Step.MOVEMENT_EXPLAIN)
		Step.MOVEMENT_EXPLAIN:
			_set_step(Step.MOVEMENT_WAIT)
		Step.MOVEMENT_CONFIRM:
			_set_step(Step.INTERACTION_EXPLAIN)
		Step.INTERACTION_EXPLAIN:
			_set_step(Step.INTERACTION_WAIT)
		Step.INTERACTION_CONFIRM:
			_set_step(Step.MECHANIC_EXPLAIN)
		Step.MECHANIC_EXPLAIN:
			_set_step(Step.MECHANIC_WAIT)
		Step.MECHANIC_CONFIRM:
			_set_step(Step.COLLECT_EXPLAIN)
		Step.COLLECT_EXPLAIN:
			_set_step(Step.COLLECT_WAIT)
		Step.COLLECT_CONFIRM:
			_set_step(Step.REPAIR_EXPLAIN)
		Step.REPAIR_EXPLAIN:
			_set_step(Step.REPAIR_WAIT)
		Step.REPAIR_CONFIRM:
			_set_step(Step.SELL_EXPLAIN)
		Step.SELL_EXPLAIN:
			_set_step(Step.SELL_WAIT)
		Step.SELL_CONFIRM:
			_set_step(Step.END_DIALOGUE)
		Step.END_DIALOGUE:
			_set_step(Step.COMPLETED)


func _on_inventory_changed() -> void:
	if current_step == Step.INTERACTION_WAIT:
		# Detecta que o jogador pegou peças no chão
		var count = _count_inventory_items()
		if count > initial_item_count:
			_hide_controls()
			_set_step(Step.INTERACTION_CONFIRM)

	elif current_step == Step.COLLECT_WAIT:
		# Detecta que o jogador coletou recursos (madeira)
		if InventoryManager.has_item(WOOD_ITEM_DATA, 1) or _count_inventory_items() > initial_item_count:
			_hide_controls()
			_set_step(Step.COLLECT_CONFIRM)


func _on_money_changed(_new_amount: int) -> void:
	if current_step == Step.SELL_WAIT:
		# Detecta venda real de itens (ganho de dinheiro)
		if InventoryManager.money > initial_money:
			_hide_controls()
			_set_step(Step.SELL_CONFIRM)


func _on_board_changed() -> void:
	if current_step == Step.MECHANIC_WAIT:
		if RepairMenu and RepairMenu.visible and is_instance_valid(RepairMenu.assembly_board):
			if RepairMenu.assembly_board.get_total_slots() > 0 and RepairMenu.assembly_board.is_fully_assembled():
				_hide_controls()
				_set_step(Step.MECHANIC_CONFIRM)


# ─── Funções Auxiliares ──────────────────────────────────────────────

func _show_dialogue(cue: String) -> void:
	if dialogue_resource:
		DialogueManager.show_dialogue_balloon_scene(BALLOON_SCENE, dialogue_resource, cue)
	else:
		push_warning("Tutorial: dialogue_resource é nulo. Pulando fala: " + cue)
		_on_dialogue_ended(dialogue_resource)


func _show_controls(title_text: String, controls_label_text: String) -> void:
	if controls_panel:
		controls_title.text = title_text
		controls_text.text = controls_label_text
		controls_panel.visible = true


func _hide_controls() -> void:
	if controls_panel:
		controls_panel.visible = false


func _count_inventory_items() -> int:
	var total := 0
	var items = InventoryManager.get_all_items()
	for item in items:
		total += items[item]
	return total


func _ensure_required_pieces() -> void:
	# Garante que o jogador possua pelo menos 2 triângulos para montar o quadrado
	if TRIANGLE_ITEM_DATA:
		var current_qty: int = 0
		var items = InventoryManager.get_all_items()
		if items.has(TRIANGLE_ITEM_DATA):
			current_qty = items[TRIANGLE_ITEM_DATA]
		if current_qty < 2:
			InventoryManager.add_item(TRIANGLE_ITEM_DATA, 2 - current_qty)


func _ensure_sellable_items() -> void:
	# Garante que o jogador tenha algum item com valor no inventário para vender
	var items = InventoryManager.get_all_items()
	var has_valuable := false
	for item in items:
		if item.price > 0 and items[item] > 0:
			has_valuable = true
			break
	if not has_valuable and TRIANGLE_ITEM_DATA:
		InventoryManager.add_item(TRIANGLE_ITEM_DATA, 2)


func _cleanup_tutorial_state() -> void:
	if DialogueManager.dialogue_ended.is_connected(_on_dialogue_ended):
		DialogueManager.dialogue_ended.disconnect(_on_dialogue_ended)
	if InventoryManager.inventory_changed.is_connected(_on_inventory_changed):
		InventoryManager.inventory_changed.disconnect(_on_inventory_changed)
	if InventoryManager.money_changed.is_connected(_on_money_changed):
		InventoryManager.money_changed.disconnect(_on_money_changed)
	if RepairMenu and is_instance_valid(RepairMenu.assembly_board) and RepairMenu.assembly_board.board_changed.is_connected(_on_board_changed):
		RepairMenu.assembly_board.board_changed.disconnect(_on_board_changed)

	# Zera itens e dinheiro acumulados apenas para o tutorial
	var items = InventoryManager.get_all_items()
	for item in items:
		InventoryManager.remove_item(item, items[item])
	InventoryManager.money = 0


# ─── Elementos Visuais do Tutorial ───────────────────────────────────

func _create_art_placeholder() -> void:
	art_node = Node2D.new()
	art_node.name = "ArtPlaceholder"
	art_node.position = Vector2(130, 20)
	add_child(art_node)

	# Cartola Mágica (corpo roxo escuro estilizado)
	var hat_body = Polygon2D.new()
	hat_body.polygon = PackedVector2Array([
		Vector2(-20, -60), Vector2(20, -60),
		Vector2(20, -12), Vector2(-20, -12)
	])
	hat_body.color = Color(0.22, 0.1, 0.32)
	art_node.add_child(hat_body)

	# Fita Dourada da Cartola
	var hat_band = Polygon2D.new()
	hat_band.polygon = PackedVector2Array([
		Vector2(-21, -22), Vector2(21, -22),
		Vector2(21, -14), Vector2(-21, -14)
	])
	hat_band.color = Color(0.85, 0.65, 0.25)
	art_node.add_child(hat_band)

	# Aba da Cartola
	var hat_brim = Polygon2D.new()
	hat_brim.polygon = PackedVector2Array([
		Vector2(-32, -12), Vector2(32, -12),
		Vector2(32, 0), Vector2(-32, 0)
	])
	hat_brim.color = Color(0.18, 0.08, 0.26)
	art_node.add_child(hat_brim)

	# Olhos expressivos
	var left_eye = Polygon2D.new()
	left_eye.polygon = PackedVector2Array([
		Vector2(-12, 3), Vector2(-6, 3),
		Vector2(-6, 9), Vector2(-12, 9)
	])
	left_eye.color = Color.WHITE
	art_node.add_child(left_eye)

	var right_eye = Polygon2D.new()
	right_eye.polygon = PackedVector2Array([
		Vector2(6, 3), Vector2(12, 3),
		Vector2(12, 9), Vector2(6, 9)
	])
	right_eye.color = Color.WHITE
	art_node.add_child(right_eye)

	# Rótulo de Identificação
	var name_label = Label.new()
	name_label.text = "Art (Guia)"
	name_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	name_label.add_theme_font_size_override("font_size", 13)
	name_label.add_theme_color_override("font_color", Color(0.9, 0.75, 0.3))
	name_label.position = Vector2(-35, 14)
	art_node.add_child(name_label)

	# Animação suave de flutuação mágica
	var tween = create_tween().set_loops()
	tween.tween_property(art_node, "position:y", 12.0, 1.3).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(art_node, "position:y", 28.0, 1.3).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)


func _create_tutorial_ui() -> void:
	tutorial_ui_layer = CanvasLayer.new()
	tutorial_ui_layer.name = "TutorialUI"
	tutorial_ui_layer.layer = 15
	add_child(tutorial_ui_layer)

	controls_panel = PanelContainer.new()
	controls_panel.name = "ControlsPanel"
	controls_panel.custom_minimum_size = Vector2(340, 85)
	controls_panel.anchor_left = 0.5
	controls_panel.anchor_right = 0.5
	controls_panel.anchor_top = 0.0
	controls_panel.anchor_bottom = 0.0
	controls_panel.offset_left = -170
	controls_panel.offset_right = 170
	controls_panel.offset_top = 24
	controls_panel.offset_bottom = 109
	tutorial_ui_layer.add_child(controls_panel)

	# Estilo elegante com tema steampunk / bronze
	var style = StyleBoxFlat.new()
	style.bg_color = Color(0.08, 0.1, 0.14, 0.92)
	style.border_width_bottom = 3
	style.border_width_top = 3
	style.border_width_left = 3
	style.border_width_right = 3
	style.border_color = Color(0.85, 0.65, 0.3)
	style.corner_radius_bottom_left = 10
	style.corner_radius_bottom_right = 10
	style.corner_radius_top_left = 10
	style.corner_radius_top_right = 10
	style.shadow_size = 8
	style.shadow_color = Color(0, 0, 0, 0.6)
	controls_panel.add_theme_stylebox_override("panel", style)

	var margin = MarginContainer.new()
	margin.add_theme_constant_override("margin_left", 20)
	margin.add_theme_constant_override("margin_right", 20)
	margin.add_theme_constant_override("margin_top", 10)
	margin.add_theme_constant_override("margin_bottom", 10)
	controls_panel.add_child(margin)

	var vbox = VBoxContainer.new()
	vbox.alignment = BoxContainer.ALIGNMENT_CENTER
	vbox.add_theme_constant_override("separation", 6)
	margin.add_child(vbox)

	controls_title = Label.new()
	controls_title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	controls_title.add_theme_font_size_override("font_size", 14)
	controls_title.add_theme_color_override("font_color", Color(0.85, 0.65, 0.3))
	vbox.add_child(controls_title)

	controls_text = Label.new()
	controls_text.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	controls_text.add_theme_font_size_override("font_size", 20)
	controls_text.add_theme_color_override("font_color", Color.WHITE)
	vbox.add_child(controls_text)

	controls_panel.visible = false


func _spawn_triangle_items() -> void:
	var physical_item_scene = preload("res://cenas/genericas/physical_item.tscn")
	if not physical_item_scene or not TRIANGLE_ITEM_DATA:
		return

	# Coloca 3 triângulos próximos ao tapete da máquina de triângulos para coleta
	for i in range(3):
		var item: Node2D = physical_item_scene.instantiate()
		item.item_data = TRIANGLE_ITEM_DATA
		item.position = Vector2(-280 + i * 40, -120)
		item.name = "TrianguloItem" + str(i + 1)
		add_child(item)


func _configure_machines() -> void:
	# No tutorial, a máquina de triângulos já começa operando e não quebra aleatoriamente
	if maquina_triangulos:
		maquina_triangulos.breakage_chance = 0.0
		maquina_triangulos.current_state = 1 # WORKING
	# A máquina de quadrados começa quebrada para demonstrar montagem e reparo
	if maquina_quadrados:
		maquina_quadrados.breakage_chance = 0.0
		maquina_quadrados.current_state = 0 # BROKEN
