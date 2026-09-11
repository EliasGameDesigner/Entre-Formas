# Graph Report - facul-pro-1  (2026-09-11)

## Corpus Check
- 153 files · ~190,478 words
- Verdict: corpus is large enough that graph structure adds value.

## Summary
- 1339 nodes · 2812 edges · 45 communities detected
- Extraction: 77% EXTRACTED · 23% INFERRED · 0% AMBIGUOUS · INFERRED: 659 edges (avg confidence: 0.8)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- [[_COMMUNITY_Community 0|Community 0]]
- [[_COMMUNITY_Community 1|Community 1]]
- [[_COMMUNITY_Community 2|Community 2]]
- [[_COMMUNITY_Community 3|Community 3]]
- [[_COMMUNITY_Community 4|Community 4]]
- [[_COMMUNITY_Community 5|Community 5]]
- [[_COMMUNITY_Community 6|Community 6]]
- [[_COMMUNITY_Community 7|Community 7]]
- [[_COMMUNITY_Community 8|Community 8]]
- [[_COMMUNITY_Community 9|Community 9]]
- [[_COMMUNITY_Community 10|Community 10]]
- [[_COMMUNITY_Community 11|Community 11]]
- [[_COMMUNITY_Community 12|Community 12]]
- [[_COMMUNITY_Community 13|Community 13]]
- [[_COMMUNITY_Community 14|Community 14]]
- [[_COMMUNITY_Community 15|Community 15]]
- [[_COMMUNITY_Community 16|Community 16]]
- [[_COMMUNITY_Community 17|Community 17]]
- [[_COMMUNITY_Community 18|Community 18]]
- [[_COMMUNITY_Community 19|Community 19]]
- [[_COMMUNITY_Community 20|Community 20]]
- [[_COMMUNITY_Community 21|Community 21]]
- [[_COMMUNITY_Community 22|Community 22]]
- [[_COMMUNITY_Community 23|Community 23]]
- [[_COMMUNITY_Community 24|Community 24]]
- [[_COMMUNITY_Community 25|Community 25]]
- [[_COMMUNITY_Community 26|Community 26]]
- [[_COMMUNITY_Community 27|Community 27]]
- [[_COMMUNITY_Community 28|Community 28]]
- [[_COMMUNITY_Community 29|Community 29]]
- [[_COMMUNITY_Community 30|Community 30]]
- [[_COMMUNITY_Community 31|Community 31]]
- [[_COMMUNITY_Community 32|Community 32]]
- [[_COMMUNITY_Community 33|Community 33]]
- [[_COMMUNITY_Community 34|Community 34]]
- [[_COMMUNITY_Community 35|Community 35]]
- [[_COMMUNITY_Community 36|Community 36]]
- [[_COMMUNITY_Community 37|Community 37]]
- [[_COMMUNITY_Community 38|Community 38]]
- [[_COMMUNITY_Community 39|Community 39]]
- [[_COMMUNITY_Community 40|Community 40]]
- [[_COMMUNITY_Community 41|Community 41]]
- [[_COMMUNITY_Community 42|Community 42]]
- [[_COMMUNITY_Community 43|Community 43]]
- [[_COMMUNITY_Community 44|Community 44]]

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
- `stop_ambient()` --calls--> `stop()`  [INFERRED]
  audio_manager.gd → addons/dialogue_manager/views/debugger_view.gd
- `update_animation()` --calls--> `stop()`  [INFERRED]
  interactble_player.gd → addons/dialogue_manager/views/debugger_view.gd
- `_on_interaction_started()` --calls--> `stop_interaction()`  [INFERRED]
  physical_item.gd → sistemas/Interagir/interactable.gd
- `tiles_changed()` --calls--> `add_item()`  [INFERRED]
  addons/better-terrain/editor/Dock.gd → sistemas/inventory_manager.gd
- `_show_dialogue()` --calls--> `show_dialogue_balloon_scene()`  [INFERRED]
  cenas/tutorial/tutorial.gd → addons/dialogue_manager/dialogue_manager.gd

## Hyperedges (group relationships)
- **Fantástica Fábrica de Formas Core Tycoon Loop** — gdd_core_game_loop, gdd_sistema_producao_formas, gdd_sistema_economico, gdd_sistema_reparo_manutencao, inventory_manager_gd, shop_node_gd, machine_node_gd [INFERRED 0.95]
- **Geometria Pedagógica e Produção de Formas** — gdd_aprendizado_invisivel, gdd_formulas_geometricas, gdd_progressao_pedagogica, machine_data_gd, machine_node_gd, item_data_gd [INFERRED 0.92]
- **Movimentação do Protagonista e Interações** — gdd_protagonista_pit, interactble_player_gd, interactable_gd, game_ui_gd, readme_2d_controls_toolkit [INFERRED 0.90]

## Communities

### Community 0 - "Community 0"
Cohesion: 0.03
Nodes (113): Machine Animation Spritesheet, play_ambient(), play_sfx(), stop_ambient(), CanvasLayer, _on_started(), start(), queue_updating_dependencies() (+105 more)

### Community 1 - "Community 1"
Cohesion: 0.04
Nodes (116): add_file(), get_dependent_paths_for_reimport(), _get_dialogue_files_in_filesystem(), get_file_data(), get_files_with_dependency(), get_files_with_errors(), has_file(), mark_files_for_reimport() (+108 more)

### Community 2 - "Community 2"
Cohesion: 0.04
Nodes (94): get_terrain(), get_tile_symmetry_type(), get_tile_terrain_type(), terrain_count(), tile_peering_types(), cell_polygon(), ConfirmationDialog, about_to_be_visible() (+86 more)

### Community 3 - "Community 3"
Cohesion: 0.05
Nodes (89): has_resolve_method_failed(), is_supported(), resolve_color_property(), resolve_method(), resolve_property(), resolve_vector2_property(), resolve_vector3_property(), resolve_vector4_property() (+81 more)

### Community 4 - "Community 4"
Cohesion: 0.05
Nodes (79): _get_line_syntax_highlighting(), _highlight_expression(), _highlight_goto(), add_error(), add_reference_to_cue(), build_line_tree(), compile(), extract_condition() (+71 more)

### Community 5 - "Community 5"
Cohesion: 0.04
Nodes (13): Container, DialogueLabel, DialogueManagerRuntime, DialogueLine, DialogueManager, DialogueManagerRuntime, DialogueResponse, DialogueManagerRuntime (+5 more)

### Community 6 - "Community 6"
Cohesion: 0.06
Nodes (71): add_terrain(), add_tile_peering_type(), apply_terrain_changeset(), _clear_invalid_peering_types(), create_terrain_changeset(), _get_cache(), _get_cache_terrain(), get_cell() (+63 more)

### Community 7 - "Community 7"
Cohesion: 0.05
Nodes (49): _get_speed(), _mutate_inline_mutations(), _mutate_remaining_mutations(), _process(), _should_auto_pause(), finished_typing(signal), skipped_typing(signal), spoke(signal) (+41 more)

### Community 8 - "Community 8"
Cohesion: 0.07
Nodes (60): _add_character_name_completions(), _add_jump_completions(), _add_mutation_completions(), check_active_cue(), _confirm_code_completion(), delete_current_line(), _drop_data(), _find_definition_in_script() (+52 more)

### Community 9 - "Community 9"
Cohesion: 0.05
Nodes (26): Area2D, Character Spritesheet (Pit), CharacterBody2D, DialogueActionable2D, DialogueManagerRuntime, Level Design (Fábrica Indoor & Floresta Outdoor), Pit (Protagonista), Interactable (+18 more)

### Community 10 - "Community 10"
Cohesion: 0.07
Nodes (45): BaseDialogueTestScene, apply_filter(), apply_theme(), _on_list_item_clicked(), _on_menu_button_about_to_popup(), _on_menu_button_id_pressed(), _on_theme_changed(), _ready() (+37 more)

### Community 11 - "Community 11"
Cohesion: 0.06
Nodes (34): apply_theme(), _on_banner_image_gui_input(), _on_buy_my_game_pressed(), _on_examples_pressed(), _on_new_button_pressed(), _on_quick_open_pressed(), new_button_pressed(signal), quick_open_button_pressed(signal) (+26 more)

### Community 12 - "Community 12"
Cohesion: 0.1
Nodes (26): BaseControler2D, get_direction(), get_speed(), move(), ChangeSpriteDirection(signal), hit_ceiling(signal), EditorPlugin, SideScrollingControler2D (+18 more)

### Community 13 - "Community 13"
Cohesion: 0.06
Nodes (2): BetterTerrain, MethodName

### Community 14 - "Community 14"
Cohesion: 0.12
Nodes (21): Button, Control, _on_download_button_pressed(), _on_http_request_request_completed(), _on_notes_button_pressed(), _ready(), failed(signal), updated(signal) (+13 more)

### Community 15 - "Community 15"
Cohesion: 0.09
Nodes (12): compile_string(), add_errors_to_file(), DMImportPlugin, DMTranslationParserPlugin, DMTranslationUtilities, _parse_file(), _get_save_extension(), _import() (+4 more)

### Community 16 - "Community 16"
Cohesion: 0.11
Nodes (21): _gui_input(), _ready(), setup(), _setup_child_mouse_filters(), _setup_styles(), item_clicked(signal), update_display(), InventoryDragItem (+13 more)

### Community 17 - "Community 17"
Cohesion: 0.12
Nodes (20): _capture(), _on_breaked(), _on_stopped(), _setup_session(), add_line(), create_state_items(), _get_resource_and_id(), _on_clear_button_pressed() (+12 more)

### Community 18 - "Community 18"
Cohesion: 0.24
Nodes (14): get_files(), find_in_files(), find_in_line(), get_selection_key(), _on_input_text_submitted(), _on_match_case_button_toggled(), _on_replace_all_button_pressed(), _on_replace_input_text_changed() (+6 more)

### Community 19 - "Community 19"
Cohesion: 0.22
Nodes (3): Area3D, DialogueActionable3D, DialogueManagerRuntime

### Community 20 - "Community 20"
Cohesion: 0.32
Nodes (5): action(), _on_dialogue_ended(), actioned(signal), dialogue_ended(signal), DialogueActionable2D

### Community 21 - "Community 21"
Cohesion: 0.32
Nodes (5): action(), _on_dialogue_ended(), actioned(signal), dialogue_ended(signal), DialogueActionable3D

### Community 22 - "Community 22"
Cohesion: 0.29
Nodes (3): DialogueManagerRuntime, DialogueMarker2D, Marker2D

### Community 23 - "Community 23"
Cohesion: 0.29
Nodes (3): DialogueManagerRuntime, DialogueMarker3D, Marker3D

### Community 24 - "Community 24"
Cohesion: 0.38
Nodes (4): DMWaiter, clear_all(), _input(), waited(signal)

### Community 25 - "Community 25"
Cohesion: 0.29
Nodes (7): Aprendizado Invisível de Geometria, Core Game Loop (Comprar -> Coletar -> Reparar -> Vender), Fantástica Fábrica de Formas (GDD), Fórmulas de Geometria Plana e Áreas, Sistema Econômico e Loja de Formas, Sistema de Produção de Formas Geométricas, Sistema de Reparo e Manutenção da Fábrica

### Community 26 - "Community 26"
Cohesion: 0.4
Nodes (3): all(), find_for_character(), DialogueMarker2D

### Community 27 - "Community 27"
Cohesion: 0.5
Nodes (3): DMInspectorPlugin, _is_dialogue_resource_property(), _parse_property()

### Community 28 - "Community 28"
Cohesion: 0.4
Nodes (1): DMPreviewGenerator

### Community 29 - "Community 29"
Cohesion: 0.5
Nodes (1): DMTreeLine

### Community 30 - "Community 30"
Cohesion: 0.67
Nodes (1): DMResolvedTagData

### Community 31 - "Community 31"
Cohesion: 0.67
Nodes (1): DMError

### Community 32 - "Community 32"
Cohesion: 1.0
Nodes (1): DMCompilerRegEx

### Community 33 - "Community 33"
Cohesion: 1.0
Nodes (1): DMCompilerResult

### Community 34 - "Community 34"
Cohesion: 1.0
Nodes (1): Progressão Pedagógica (15 Máquinas)

### Community 35 - "Community 35"
Cohesion: 1.0
Nodes (1): Art (Cartola Mágica / Tutorial)

### Community 36 - "Community 36"
Cohesion: 1.0
Nodes (1): Missões Ambientais e Dinâmicas (Ratos e Buracos)

### Community 37 - "Community 37"
Cohesion: 1.0
Nodes (1): Montagem de Engrenagens com Formas

### Community 38 - "Community 38"
Cohesion: 1.0
Nodes (1): Narrativa da Revolução Geométrica de 1962

### Community 39 - "Community 39"
Cohesion: 1.0
Nodes (1): Direção de Arte Pixel Art 16-bit

### Community 40 - "Community 40"
Cohesion: 1.0
Nodes (1): Assembling Machine Entity Visual

### Community 41 - "Community 41"
Cohesion: 1.0
Nodes (1): UI Shape Parts & Repair Slots (Square, Triangle, Rectangle)

### Community 42 - "Community 42"
Cohesion: 1.0
Nodes (1): Shop & Commerce Sprite

### Community 43 - "Community 43"
Cohesion: 1.0
Nodes (1): Buraco no Chão (Tarefa de Manutenção)

### Community 44 - "Community 44"
Cohesion: 1.0
Nodes (1): Pixel Crawler Environment & Props Pack

## Knowledge Gaps
- **100 isolated node(s):** `GameUia`, `PhysicalItem`, `ResourceSpawnPoint`, `hit_ceiling(signal)`, `SideScrollingControler2D` (+95 more)
  These have ≤1 connection - possible missing edges or undocumented components.
- **Thin community `Community 13`** (33 nodes): `BetterTerrain.cs`, `BetterTerrain`, `.AddTerrain()`, `.AddTilePeeringType()`, `.ApplyTerrainChangeset()`, `.CreateTerrainChangeset()`, `.GetCell()`, `.GetTerrain()`, `.GetTerrainCategories()`, `.GetTilesInTerrain()`, `.GetTileSourcesInTerrain()`, `.GetTileSymmetryType()`, `.GetTileTerrainType()`, `.IsTerrainChangesetReady()`, `.RemoveTerrain()`, `.RemoveTilePeeringType()`, `.ReplaceCell()`, `.ReplaceCells()`, `.SetCell()`, `.SetCells()`, `.SetTerrain()`, `.SetTileSymmetryType()`, `.SetTileTerrainType()`, `.SwapTerrains()`, `.TerrainCount()`, `.TilePeeringForType()`, `.TilePeeringKeys()`, `.TilePeeringTypes()`, `.UpdateTerrainArea()`, `.UpdateTerrainCell()`, `.UpdateTerrainCells()`, `.WaitForTerrainChangeset()`, `MethodName`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 28`** (5 nodes): `preview_generator.gd`, `DMPreviewGenerator`, `_generate()`, `_generate_small_preview_automatically()`, `_handles()`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 29`** (4 nodes): `tree_line.gd`, `DMTreeLine`, `_init()`, `_to_string()`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 30`** (3 nodes): `resolved_tag_data.gd`, `DMResolvedTagData`, `_init()`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 31`** (3 nodes): `error.gd`, `DMError`, `_init()`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 32`** (2 nodes): `compiler_regex.gd`, `DMCompilerRegEx`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 33`** (2 nodes): `compiler_result.gd`, `DMCompilerResult`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 34`** (1 nodes): `Progressão Pedagógica (15 Máquinas)`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 35`** (1 nodes): `Art (Cartola Mágica / Tutorial)`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 36`** (1 nodes): `Missões Ambientais e Dinâmicas (Ratos e Buracos)`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 37`** (1 nodes): `Montagem de Engrenagens com Formas`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 38`** (1 nodes): `Narrativa da Revolução Geométrica de 1962`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 39`** (1 nodes): `Direção de Arte Pixel Art 16-bit`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 40`** (1 nodes): `Assembling Machine Entity Visual`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 41`** (1 nodes): `UI Shape Parts & Repair Slots (Square, Triangle, Rectangle)`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 42`** (1 nodes): `Shop & Commerce Sprite`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 43`** (1 nodes): `Buraco no Chão (Tarefa de Manutenção)`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 44`** (1 nodes): `Pixel Crawler Environment & Props Pack`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `translate()` connect `Community 3` to `Community 1`, `Community 4`, `Community 5`, `Community 7`, `Community 10`, `Community 11`, `Community 14`, `Community 15`, `Community 17`?**
  _High betweenness centrality (0.158) - this node is a cross-community bridge._
- **Why does `add_item()` connect `Community 0` to `Community 11`, `Community 1`, `Community 2`, `Community 10`?**
  _High betweenness centrality (0.091) - this node is a cross-community bridge._
- **Why does `get_setting()` connect `Community 1` to `Community 2`, `Community 3`, `Community 4`, `Community 8`, `Community 10`, `Community 11`, `Community 15`, `Community 17`?**
  _High betweenness centrality (0.084) - this node is a cross-community bridge._
- **Are the 33 inferred relationships involving `translate()` (e.g. with `_setup_session()` and `refresh()`) actually correct?**
  _`translate()` has 33 INFERRED edges - model-reasoned connections that need verification._
- **Are the 19 inferred relationships involving `search()` (e.g. with `build_line_tree()` and `parse_cue_line()`) actually correct?**
  _`search()` has 19 INFERRED edges - model-reasoned connections that need verification._
- **Are the 24 inferred relationships involving `get_setting()` (e.g. with `_on_adjust_settings()` and `about_to_be_visible()`) actually correct?**
  _`get_setting()` has 24 INFERRED edges - model-reasoned connections that need verification._
- **What connects `GameUia`, `PhysicalItem`, `ResourceSpawnPoint` to the rest of the system?**
  _100 weakly-connected nodes found - possible documentation gaps or missing edges._