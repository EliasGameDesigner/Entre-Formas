# Graph Report - .  (2026-08-20)

## Corpus Check
- Large corpus: 391 files · ~180,694 words. Semantic extraction will be expensive (many Claude tokens). Consider running on a subfolder, or use --no-semantic to run AST-only.

## Summary
- 1234 nodes · 2545 edges · 44 communities detected
- Extraction: 77% EXTRACTED · 23% INFERRED · 0% AMBIGUOUS · INFERRED: 597 edges (avg confidence: 0.8)
- Token cost: 12,500 input · 4,200 output

## Community Hubs (Navigation)
- [[_COMMUNITY_Dialogue Editor Properties & Export|Dialogue Editor Properties & Export]]
- [[_COMMUNITY_Core Game Systems & Gameplay|Core Game Systems & Gameplay]]
- [[_COMMUNITY_BetterTerrain Editor Dock & Tools|BetterTerrain Editor Dock & Tools]]
- [[_COMMUNITY_Dialogue Manager Runtime & Utilities|Dialogue Manager Runtime & Utilities]]
- [[_COMMUNITY_Dialogue Manager C Bindings & Balloons|Dialogue Manager C# Bindings & Balloons]]
- [[_COMMUNITY_Dialogue Expression Parser & Compilation|Dialogue Expression Parser & Compilation]]
- [[_COMMUNITY_BetterTerrain GDScript API & Data|BetterTerrain GDScript API & Data]]
- [[_COMMUNITY_Dialogue Code Editor & Completions|Dialogue Code Editor & Completions]]
- [[_COMMUNITY_Dialogue Lines & Example Balloons|Dialogue Lines & Example Balloons]]
- [[_COMMUNITY_Dialogue Debugger & Cache Plugins|Dialogue Debugger & Cache Plugins]]
- [[_COMMUNITY_Cue Editor & Blank Slate UI|Cue Editor & Blank Slate UI]]
- [[_COMMUNITY_2D Controls Toolkit Controllers|2D Controls Toolkit Controllers]]
- [[_COMMUNITY_BetterTerrain C Plugin Interface|BetterTerrain C# Plugin Interface]]
- [[_COMMUNITY_Dialogue File & Cue Lists|Dialogue File & Cue Lists]]
- [[_COMMUNITY_Dialogue Manager Updates & Resources|Dialogue Manager Updates & Resources]]
- [[_COMMUNITY_Dialogue Compiler & Syntax Highlighter|Dialogue Compiler & Syntax Highlighter]]
- [[_COMMUNITY_Dialogue Search & Find in Files|Dialogue Search & Find in Files]]
- [[_COMMUNITY_Dialogue Actionable 2D C Bindings|Dialogue Actionable 2D C# Bindings]]
- [[_COMMUNITY_Dialogue Actionable 3D C Bindings|Dialogue Actionable 3D C# Bindings]]
- [[_COMMUNITY_Dialogue Actionable 2D GDScript|Dialogue Actionable 2D GDScript]]
- [[_COMMUNITY_Dialogue Actionable 3D GDScript|Dialogue Actionable 3D GDScript]]
- [[_COMMUNITY_Dialogue Marker 2D C Runtime|Dialogue Marker 2D C# Runtime]]
- [[_COMMUNITY_Dialogue Marker 3D C Runtime|Dialogue Marker 3D C# Runtime]]
- [[_COMMUNITY_Dialogue Async Waiter Utilities|Dialogue Async Waiter Utilities]]
- [[_COMMUNITY_Game Design & Geometric Pedagogy|Game Design & Geometric Pedagogy]]
- [[_COMMUNITY_Dialogue Marker 2D GDScript|Dialogue Marker 2D GDScript]]
- [[_COMMUNITY_Dialogue Inspector Plugin Handlers|Dialogue Inspector Plugin Handlers]]
- [[_COMMUNITY_Dialogue Preview Generator Component|Dialogue Preview Generator Component]]
- [[_COMMUNITY_Dialogue Tree Line Structures|Dialogue Tree Line Structures]]
- [[_COMMUNITY_Dialogue Resolved Tag Data|Dialogue Resolved Tag Data]]
- [[_COMMUNITY_Dialogue Error Handling Utilities|Dialogue Error Handling Utilities]]
- [[_COMMUNITY_Dialogue Compiler RegEx Matcher|Dialogue Compiler RegEx Matcher]]
- [[_COMMUNITY_Dialogue Compiler Execution Results|Dialogue Compiler Execution Results]]
- [[_COMMUNITY_Machine Progression & Unlocks|Machine Progression & Unlocks]]
- [[_COMMUNITY_Art NPC Tutorial Guide|Art NPC Tutorial Guide]]
- [[_COMMUNITY_Environmental Maintenance & Pest Control|Environmental Maintenance & Pest Control]]
- [[_COMMUNITY_Gear Assembly & Crafting System|Gear Assembly & Crafting System]]
- [[_COMMUNITY_Geometric Revolution Narrative|Geometric Revolution Narrative]]
- [[_COMMUNITY_16-Bit Pixel Art Aesthetics|16-Bit Pixel Art Aesthetics]]
- [[_COMMUNITY_Assembling Machine Visual Assets|Assembling Machine Visual Assets]]
- [[_COMMUNITY_Shape UI & Repair Slots|Shape UI & Repair Slots]]
- [[_COMMUNITY_Shop & Marketplace Economy|Shop & Marketplace Economy]]
- [[_COMMUNITY_Floor Repair Task Entity|Floor Repair Task Entity]]
- [[_COMMUNITY_Pixel Crawler Props & Environment|Pixel Crawler Props & Environment]]

## God Nodes (most connected - your core abstractions)
1. `translate()` - 47 edges
2. `DialogueManager` - 37 edges
3. `BetterTerrain` - 31 edges
4. `search()` - 29 edges
5. `get_setting()` - 27 edges
6. `_resolve()` - 23 edges
7. `get_line()` - 22 edges
8. `get_user_value()` - 20 edges
9. `_get_terrain_meta()` - 18 edges
10. `get_terrain()` - 18 edges

## Surprising Connections (you probably didn't know these)
- `_on_interaction_started()` --calls--> `play_sfx()`  [INFERRED]
  physical_item.gd → audio_manager.gd
- `stop_ambient()` --calls--> `stop()`  [INFERRED]
  audio_manager.gd → addons/dialogue_manager/views/debugger_view.gd
- `update_animation()` --calls--> `stop()`  [INFERRED]
  interactble_player.gd → addons/dialogue_manager/views/debugger_view.gd
- `_on_resource_gathered()` --calls--> `start()`  [INFERRED]
  resource_spawn_point.gd → addons/dialogue_manager/views/debugger_view.gd
- `tiles_changed()` --calls--> `add_item()`  [INFERRED]
  addons/better-terrain/editor/Dock.gd → sistemas/inventory_manager.gd

## Hyperedges (group relationships)
- **Fantástica Fábrica de Formas Core Tycoon Loop** — gdd_core_game_loop, gdd_sistema_producao_formas, gdd_sistema_economico, gdd_sistema_reparo_manutencao, inventory_manager_gd, shop_node_gd, machine_node_gd [INFERRED 0.95]
- **Geometria Pedagógica e Produção de Formas** — gdd_aprendizado_invisivel, gdd_formulas_geometricas, gdd_progressao_pedagogica, machine_data_gd, machine_node_gd, item_data_gd [INFERRED 0.92]
- **Movimentação do Protagonista e Interações** — gdd_protagonista_pit, interactble_player_gd, interactable_gd, game_ui_gd, readme_2d_controls_toolkit [INFERRED 0.90]

## Communities

### Community 0 - "Dialogue Editor Properties & Export"
Cohesion: 0.03
Nodes (124): BaseDialogueTestScene, move_file_path(), DMExportPlugin, DMPlugin, DMSettings, build_menu(), _on_files_list_file_double_clicked(), _on_menu_button_pressed() (+116 more)

### Community 1 - "Core Game Systems & Gameplay"
Cohesion: 0.02
Nodes (77): Character Spritesheet (Pit), Machine Animation Spritesheet, play_ambient(), play_sfx(), CanvasLayer, CharacterBody2D, start(), DialogueManagerRuntime (+69 more)

### Community 2 - "BetterTerrain Editor Dock & Tools"
Cohesion: 0.04
Nodes (94): get_terrain(), get_tile_symmetry_type(), get_tile_terrain_type(), terrain_count(), tile_peering_keys(), tile_peering_types(), cell_polygon(), ConfirmationDialog (+86 more)

### Community 3 - "Dialogue Manager Runtime & Utilities"
Cohesion: 0.05
Nodes (91): has_resolve_method_failed(), is_supported(), resolve_color_property(), resolve_method(), resolve_property(), resolve_vector2_property(), resolve_vector3_property(), resolve_vector4_property() (+83 more)

### Community 4 - "Dialogue Manager C# Bindings & Balloons"
Cohesion: 0.04
Nodes (14): Container, callv_dotnet(), DialogueLabel, DialogueManagerRuntime, DialogueLine, DialogueManager, DialogueManagerRuntime, DialogueResponse (+6 more)

### Community 5 - "Dialogue Expression Parser & Compilation"
Cohesion: 0.06
Nodes (67): add_error(), add_reference_to_cue(), build_line_tree(), compile(), extract_condition(), extract_import_path_and_name(), extract_mutation(), extract_static_line_id() (+59 more)

### Community 6 - "BetterTerrain GDScript API & Data"
Cohesion: 0.08
Nodes (64): add_terrain(), add_tile_peering_type(), apply_terrain_changeset(), _clear_invalid_peering_types(), create_terrain_changeset(), _get_cache(), _get_cache_terrain(), get_cell() (+56 more)

### Community 7 - "Dialogue Code Editor & Completions"
Cohesion: 0.07
Nodes (60): _add_character_name_completions(), _add_jump_completions(), _add_mutation_completions(), check_active_cue(), _confirm_code_completion(), delete_current_line(), _drop_data(), _find_definition_in_script() (+52 more)

### Community 8 - "Dialogue Lines & Example Balloons"
Cohesion: 0.05
Nodes (41): _get_speed(), _mutate_inline_mutations(), _mutate_remaining_mutations(), _process(), _should_auto_pause(), finished_typing(signal), skipped_typing(signal), spoke(signal) (+33 more)

### Community 9 - "Dialogue Debugger & Cache Plugins"
Cohesion: 0.05
Nodes (43): stop_ambient(), _capture(), _on_breaked(), _on_started(), _on_stopped(), _setup_session(), add_line(), create_state_items() (+35 more)

### Community 10 - "Cue Editor & Blank Slate UI"
Cohesion: 0.06
Nodes (34): apply_theme(), _on_banner_image_gui_input(), _on_buy_my_game_pressed(), _on_examples_pressed(), _on_new_button_pressed(), _on_quick_open_pressed(), new_button_pressed(signal), quick_open_button_pressed(signal) (+26 more)

### Community 11 - "2D Controls Toolkit Controllers"
Cohesion: 0.1
Nodes (26): BaseControler2D, get_direction(), get_speed(), move(), ChangeSpriteDirection(signal), hit_ceiling(signal), EditorPlugin, SideScrollingControler2D (+18 more)

### Community 12 - "BetterTerrain C# Plugin Interface"
Cohesion: 0.06
Nodes (2): BetterTerrain, MethodName

### Community 13 - "Dialogue File & Cue Lists"
Cohesion: 0.12
Nodes (25): apply_filter(), apply_theme(), _on_list_item_clicked(), _on_menu_button_about_to_popup(), _on_menu_button_id_pressed(), _on_theme_changed(), _ready(), select_cue() (+17 more)

### Community 14 - "Dialogue Manager Updates & Resources"
Cohesion: 0.12
Nodes (21): Button, Control, _on_download_button_pressed(), _on_http_request_request_completed(), _on_notes_button_pressed(), _ready(), failed(signal), updated(signal) (+13 more)

### Community 15 - "Dialogue Compiler & Syntax Highlighter"
Cohesion: 0.14
Nodes (16): _get_line_syntax_highlighting(), _highlight_expression(), _highlight_goto(), extract_mutation(), extract_translatable_string(), get_line_type(), get_static_line_id(), DMCompiler (+8 more)

### Community 16 - "Dialogue Search & Find in Files"
Cohesion: 0.26
Nodes (13): find_in_files(), find_in_line(), get_selection_key(), _on_input_text_submitted(), _on_match_case_button_toggled(), _on_replace_all_button_pressed(), _on_replace_input_text_changed(), _on_replace_selected_button_pressed() (+5 more)

### Community 17 - "Dialogue Actionable 2D C# Bindings"
Cohesion: 0.22
Nodes (3): Area2D, DialogueActionable2D, DialogueManagerRuntime

### Community 18 - "Dialogue Actionable 3D C# Bindings"
Cohesion: 0.22
Nodes (3): Area3D, DialogueActionable3D, DialogueManagerRuntime

### Community 19 - "Dialogue Actionable 2D GDScript"
Cohesion: 0.32
Nodes (5): action(), _on_dialogue_ended(), actioned(signal), dialogue_ended(signal), DialogueActionable2D

### Community 20 - "Dialogue Actionable 3D GDScript"
Cohesion: 0.32
Nodes (5): action(), _on_dialogue_ended(), actioned(signal), dialogue_ended(signal), DialogueActionable3D

### Community 21 - "Dialogue Marker 2D C# Runtime"
Cohesion: 0.29
Nodes (3): DialogueManagerRuntime, DialogueMarker2D, Marker2D

### Community 22 - "Dialogue Marker 3D C# Runtime"
Cohesion: 0.29
Nodes (3): DialogueManagerRuntime, DialogueMarker3D, Marker3D

### Community 23 - "Dialogue Async Waiter Utilities"
Cohesion: 0.38
Nodes (4): DMWaiter, clear_all(), _input(), waited(signal)

### Community 24 - "Game Design & Geometric Pedagogy"
Cohesion: 0.29
Nodes (7): Aprendizado Invisível de Geometria, Core Game Loop (Comprar -> Coletar -> Reparar -> Vender), Fantástica Fábrica de Formas (GDD), Fórmulas de Geometria Plana e Áreas, Sistema Econômico e Loja de Formas, Sistema de Produção de Formas Geométricas, Sistema de Reparo e Manutenção da Fábrica

### Community 25 - "Dialogue Marker 2D GDScript"
Cohesion: 0.4
Nodes (3): all(), find_for_character(), DialogueMarker2D

### Community 26 - "Dialogue Inspector Plugin Handlers"
Cohesion: 0.5
Nodes (3): DMInspectorPlugin, _is_dialogue_resource_property(), _parse_property()

### Community 27 - "Dialogue Preview Generator Component"
Cohesion: 0.4
Nodes (1): DMPreviewGenerator

### Community 28 - "Dialogue Tree Line Structures"
Cohesion: 0.5
Nodes (1): DMTreeLine

### Community 29 - "Dialogue Resolved Tag Data"
Cohesion: 0.67
Nodes (1): DMResolvedTagData

### Community 30 - "Dialogue Error Handling Utilities"
Cohesion: 0.67
Nodes (1): DMError

### Community 31 - "Dialogue Compiler RegEx Matcher"
Cohesion: 1.0
Nodes (1): DMCompilerRegEx

### Community 32 - "Dialogue Compiler Execution Results"
Cohesion: 1.0
Nodes (1): DMCompilerResult

### Community 33 - "Machine Progression & Unlocks"
Cohesion: 1.0
Nodes (1): Progressão Pedagógica (15 Máquinas)

### Community 34 - "Art NPC Tutorial Guide"
Cohesion: 1.0
Nodes (1): Art (Cartola Mágica / Tutorial)

### Community 35 - "Environmental Maintenance & Pest Control"
Cohesion: 1.0
Nodes (1): Missões Ambientais e Dinâmicas (Ratos e Buracos)

### Community 36 - "Gear Assembly & Crafting System"
Cohesion: 1.0
Nodes (1): Montagem de Engrenagens com Formas

### Community 37 - "Geometric Revolution Narrative"
Cohesion: 1.0
Nodes (1): Narrativa da Revolução Geométrica de 1962

### Community 38 - "16-Bit Pixel Art Aesthetics"
Cohesion: 1.0
Nodes (1): Direção de Arte Pixel Art 16-bit

### Community 39 - "Assembling Machine Visual Assets"
Cohesion: 1.0
Nodes (1): Assembling Machine Entity Visual

### Community 40 - "Shape UI & Repair Slots"
Cohesion: 1.0
Nodes (1): UI Shape Parts & Repair Slots (Square, Triangle, Rectangle)

### Community 41 - "Shop & Marketplace Economy"
Cohesion: 1.0
Nodes (1): Shop & Commerce Sprite

### Community 42 - "Floor Repair Task Entity"
Cohesion: 1.0
Nodes (1): Buraco no Chão (Tarefa de Manutenção)

### Community 43 - "Pixel Crawler Props & Environment"
Cohesion: 1.0
Nodes (1): Pixel Crawler Environment & Props Pack

## Knowledge Gaps
- **96 isolated node(s):** `GameUia`, `PhysicalItem`, `ResourceSpawnPoint`, `hit_ceiling(signal)`, `SideScrollingControler2D` (+91 more)
  These have ≤1 connection - possible missing edges or undocumented components.
- **Thin community `BetterTerrain C# Plugin Interface`** (33 nodes): `BetterTerrain.cs`, `BetterTerrain`, `.AddTerrain()`, `.AddTilePeeringType()`, `.ApplyTerrainChangeset()`, `.CreateTerrainChangeset()`, `.GetCell()`, `.GetTerrain()`, `.GetTerrainCategories()`, `.GetTilesInTerrain()`, `.GetTileSourcesInTerrain()`, `.GetTileSymmetryType()`, `.GetTileTerrainType()`, `.IsTerrainChangesetReady()`, `.RemoveTerrain()`, `.RemoveTilePeeringType()`, `.ReplaceCell()`, `.ReplaceCells()`, `.SetCell()`, `.SetCells()`, `.SetTerrain()`, `.SetTileSymmetryType()`, `.SetTileTerrainType()`, `.SwapTerrains()`, `.TerrainCount()`, `.TilePeeringForType()`, `.TilePeeringKeys()`, `.TilePeeringTypes()`, `.UpdateTerrainArea()`, `.UpdateTerrainCell()`, `.UpdateTerrainCells()`, `.WaitForTerrainChangeset()`, `MethodName`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Dialogue Preview Generator Component`** (5 nodes): `preview_generator.gd`, `DMPreviewGenerator`, `_generate()`, `_generate_small_preview_automatically()`, `_handles()`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Dialogue Tree Line Structures`** (4 nodes): `tree_line.gd`, `DMTreeLine`, `_init()`, `_to_string()`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Dialogue Resolved Tag Data`** (3 nodes): `resolved_tag_data.gd`, `DMResolvedTagData`, `_init()`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Dialogue Error Handling Utilities`** (3 nodes): `error.gd`, `DMError`, `_init()`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Dialogue Compiler RegEx Matcher`** (2 nodes): `compiler_regex.gd`, `DMCompilerRegEx`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Dialogue Compiler Execution Results`** (2 nodes): `compiler_result.gd`, `DMCompilerResult`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Machine Progression & Unlocks`** (1 nodes): `Progressão Pedagógica (15 Máquinas)`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Art NPC Tutorial Guide`** (1 nodes): `Art (Cartola Mágica / Tutorial)`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Environmental Maintenance & Pest Control`** (1 nodes): `Missões Ambientais e Dinâmicas (Ratos e Buracos)`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Gear Assembly & Crafting System`** (1 nodes): `Montagem de Engrenagens com Formas`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Geometric Revolution Narrative`** (1 nodes): `Narrativa da Revolução Geométrica de 1962`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `16-Bit Pixel Art Aesthetics`** (1 nodes): `Direção de Arte Pixel Art 16-bit`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Assembling Machine Visual Assets`** (1 nodes): `Assembling Machine Entity Visual`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Shape UI & Repair Slots`** (1 nodes): `UI Shape Parts & Repair Slots (Square, Triangle, Rectangle)`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Shop & Marketplace Economy`** (1 nodes): `Shop & Commerce Sprite`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Floor Repair Task Entity`** (1 nodes): `Buraco no Chão (Tarefa de Manutenção)`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Pixel Crawler Props & Environment`** (1 nodes): `Pixel Crawler Environment & Props Pack`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `translate()` connect `Dialogue Manager Runtime & Utilities` to `Dialogue Editor Properties & Export`, `Dialogue Manager C# Bindings & Balloons`, `Dialogue Expression Parser & Compilation`, `Dialogue Lines & Example Balloons`, `Dialogue Debugger & Cache Plugins`, `Cue Editor & Blank Slate UI`, `Dialogue File & Cue Lists`, `Dialogue Manager Updates & Resources`?**
  _High betweenness centrality (0.187) - this node is a cross-community bridge._
- **Why does `get_setting()` connect `Dialogue Editor Properties & Export` to `BetterTerrain Editor Dock & Tools`, `Dialogue Manager Runtime & Utilities`, `Dialogue Expression Parser & Compilation`, `Dialogue Code Editor & Completions`, `Dialogue Debugger & Cache Plugins`, `Cue Editor & Blank Slate UI`?**
  _High betweenness centrality (0.078) - this node is a cross-community bridge._
- **Why does `add_item()` connect `Core Game Systems & Gameplay` to `Dialogue Editor Properties & Export`, `BetterTerrain Editor Dock & Tools`, `Cue Editor & Blank Slate UI`, `Dialogue File & Cue Lists`?**
  _High betweenness centrality (0.073) - this node is a cross-community bridge._
- **Are the 33 inferred relationships involving `translate()` (e.g. with `_setup_session()` and `refresh()`) actually correct?**
  _`translate()` has 33 INFERRED edges - model-reasoned connections that need verification._
- **Are the 19 inferred relationships involving `search()` (e.g. with `build_line_tree()` and `parse_cue_line()`) actually correct?**
  _`search()` has 19 INFERRED edges - model-reasoned connections that need verification._
- **Are the 24 inferred relationships involving `get_setting()` (e.g. with `_on_adjust_settings()` and `about_to_be_visible()`) actually correct?**
  _`get_setting()` has 24 INFERRED edges - model-reasoned connections that need verification._
- **What connects `GameUia`, `PhysicalItem`, `ResourceSpawnPoint` to the rest of the system?**
  _96 weakly-connected nodes found - possible documentation gaps or missing edges._