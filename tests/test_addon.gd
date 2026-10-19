extends SceneTree
# Headless check for Crisp Pixel Free Theme. Run from the project folder:
#   godot --headless --path . --script res://tests/test_addon.gd
# Loads both Theme resources, checks every item the build wrote, every StyleBox texture and 9-slice margin,
# every PNG in the addon, then opens the demo scene and uses its controls.

const ADDON := "res://addons/crisp_pixel_free/"
const THEMES := ["crisp_pixel_free.tres", "crisp_pixel_free_2x.tres", "crisp_pixel_free_3x.tres", "crisp_pixel_free_4x.tres"]
const DEMO := "demo/pixel_free_demo.tscn"
const TEXTURES := 212
# [type, kind, name] for every item the theme sets (kind: styles, icons, colors, constants, font_sizes).
const ITEMS := [
	["Button", "styles", "normal"],
	["Button", "styles", "hover"],
	["Button", "styles", "pressed"],
	["Button", "styles", "hover_pressed"],
	["Button", "styles", "disabled"],
	["Button", "styles", "focus"],
	["Button", "colors", "font_color"],
	["Button", "colors", "font_hover_color"],
	["Button", "colors", "font_pressed_color"],
	["Button", "colors", "font_focus_color"],
	["Button", "colors", "font_hover_pressed_color"],
	["Button", "colors", "icon_normal_color"],
	["Button", "colors", "icon_hover_color"],
	["Button", "colors", "icon_pressed_color"],
	["Button", "colors", "icon_focus_color"],
	["Button", "colors", "icon_hover_pressed_color"],
	["Button", "colors", "font_disabled_color"],
	["Button", "colors", "icon_disabled_color"],
	["Button", "font_sizes", "font_size"],
	["Button", "constants", "h_separation"],
	["OptionButton", "constants", "modulate_arrow"],
	["OptionButton", "constants", "arrow_margin"],
	["ButtonSquare", "styles", "normal"],
	["ButtonSquare", "styles", "hover"],
	["ButtonSquare", "styles", "pressed"],
	["ButtonSquare", "styles", "hover_pressed"],
	["ButtonSquare", "styles", "disabled"],
	["ButtonSquare", "styles", "focus"],
	["ButtonSquare", "colors", "font_color"],
	["ButtonSquare", "colors", "font_hover_color"],
	["ButtonSquare", "colors", "font_pressed_color"],
	["ButtonSquare", "colors", "font_focus_color"],
	["ButtonSquare", "colors", "font_hover_pressed_color"],
	["ButtonSquare", "colors", "icon_normal_color"],
	["ButtonSquare", "colors", "icon_hover_color"],
	["ButtonSquare", "colors", "icon_pressed_color"],
	["ButtonSquare", "colors", "icon_focus_color"],
	["ButtonSquare", "colors", "icon_hover_pressed_color"],
	["ButtonSquare", "colors", "font_disabled_color"],
	["ButtonSquare", "colors", "icon_disabled_color"],
	["ButtonSquare", "font_sizes", "font_size"],
	["ButtonSquare", "constants", "h_separation"],
	["ButtonClose", "styles", "normal"],
	["ButtonClose", "styles", "hover"],
	["ButtonClose", "styles", "pressed"],
	["ButtonClose", "styles", "hover_pressed"],
	["ButtonClose", "styles", "disabled"],
	["ButtonClose", "styles", "focus"],
	["ButtonClose", "colors", "font_color"],
	["ButtonClose", "colors", "font_hover_color"],
	["ButtonClose", "colors", "font_pressed_color"],
	["ButtonClose", "colors", "font_focus_color"],
	["ButtonClose", "colors", "font_hover_pressed_color"],
	["ButtonClose", "colors", "icon_normal_color"],
	["ButtonClose", "colors", "icon_hover_color"],
	["ButtonClose", "colors", "icon_pressed_color"],
	["ButtonClose", "colors", "icon_focus_color"],
	["ButtonClose", "colors", "icon_hover_pressed_color"],
	["ButtonClose", "colors", "font_disabled_color"],
	["ButtonClose", "colors", "icon_disabled_color"],
	["ButtonClose", "font_sizes", "font_size"],
	["ButtonClose", "constants", "h_separation"],
	["SlotButton", "styles", "normal"],
	["SlotButton", "styles", "hover"],
	["SlotButton", "styles", "pressed"],
	["SlotButton", "styles", "hover_pressed"],
	["SlotButton", "styles", "disabled"],
	["SlotButton", "styles", "focus"],
	["SlotButton", "colors", "font_color"],
	["SlotButton", "colors", "font_hover_color"],
	["SlotButton", "colors", "font_pressed_color"],
	["SlotButton", "colors", "font_focus_color"],
	["SlotButton", "colors", "font_hover_pressed_color"],
	["SlotButton", "colors", "icon_normal_color"],
	["SlotButton", "colors", "icon_hover_color"],
	["SlotButton", "colors", "icon_pressed_color"],
	["SlotButton", "colors", "icon_focus_color"],
	["SlotButton", "colors", "icon_hover_pressed_color"],
	["SlotButton", "colors", "font_disabled_color"],
	["SlotButton", "colors", "icon_disabled_color"],
	["SlotButton", "font_sizes", "font_size"],
	["SlotButton", "constants", "h_separation"],
	["CheckBox", "styles", "normal"],
	["CheckBox", "styles", "hover"],
	["CheckBox", "styles", "pressed"],
	["CheckBox", "styles", "hover_pressed"],
	["CheckBox", "styles", "disabled"],
	["CheckBox", "styles", "focus"],
	["CheckBox", "colors", "font_color"],
	["CheckBox", "colors", "font_hover_color"],
	["CheckBox", "colors", "font_pressed_color"],
	["CheckBox", "colors", "font_focus_color"],
	["CheckBox", "colors", "font_hover_pressed_color"],
	["CheckBox", "colors", "font_disabled_color"],
	["CheckBox", "constants", "h_separation"],
	["CheckBox", "font_sizes", "font_size"],
	["CheckButton", "styles", "normal"],
	["CheckButton", "styles", "hover"],
	["CheckButton", "styles", "pressed"],
	["CheckButton", "styles", "hover_pressed"],
	["CheckButton", "styles", "disabled"],
	["CheckButton", "styles", "focus"],
	["CheckButton", "colors", "font_color"],
	["CheckButton", "colors", "font_hover_color"],
	["CheckButton", "colors", "font_pressed_color"],
	["CheckButton", "colors", "font_focus_color"],
	["CheckButton", "colors", "font_hover_pressed_color"],
	["CheckButton", "colors", "font_disabled_color"],
	["CheckButton", "constants", "h_separation"],
	["CheckButton", "font_sizes", "font_size"],
	["CheckBox", "icons", "checked"],
	["CheckBox", "icons", "unchecked"],
	["CheckBox", "icons", "checked_disabled"],
	["CheckBox", "icons", "unchecked_disabled"],
	["Label", "colors", "font_color"],
	["Label", "font_sizes", "font_size"],
	["LabelMuted", "colors", "font_color"],
	["LabelMuted", "font_sizes", "font_size"],
	["LabelTitle", "colors", "font_color"],
	["LabelTitle", "font_sizes", "font_size"],
	["LabelOnAccent", "colors", "font_color"],
	["LabelOnAccent", "font_sizes", "font_size"],
	["LabelOnDark", "colors", "font_color"],
	["LabelOnDark", "font_sizes", "font_size"],
	["LabelTooltip", "colors", "font_color"],
	["LabelTooltip", "font_sizes", "font_size"],
	["LabelWell", "colors", "font_color"],
	["LabelWell", "font_sizes", "font_size"],
	["Panel", "styles", "panel"],
	["PanelContainer", "styles", "panel"],
	["PanelInset", "styles", "panel"],
	["WindowPanel", "styles", "panel"],
	["DialogBox", "styles", "panel"],
	["NamePlate", "styles", "panel"],
	["TooltipBox", "styles", "panel"],
	["Ribbon", "styles", "panel"],
	["CurrencyPlate", "styles", "panel"],
	["QuestEntry", "styles", "panel"],
	["ListRow", "styles", "panel"],
	["Slot", "styles", "panel"],
	["SlotHover", "styles", "panel"],
	["SlotSelected", "styles", "panel"],
	["SlotRare", "styles", "panel"],
	["SlotEpic", "styles", "panel"],
	["HotbarSlot", "styles", "panel"],
	["PortraitFrame", "styles", "panel"],
	["ProgressBar", "styles", "background"],
	["ProgressBar", "styles", "fill"],
	["ProgressBar", "colors", "font_color"],
	["ProgressBar", "font_sizes", "font_size"],
	["ProgressBarMana", "styles", "fill"],
	["HSlider", "styles", "slider"],
	["HSlider", "styles", "grabber_area"],
	["HSlider", "styles", "grabber_area_highlight"],
	["HSlider", "icons", "grabber"],
	["HSlider", "icons", "grabber_highlight"],
	["HSlider", "icons", "grabber_disabled"],
	["LineEdit", "styles", "normal"],
	["LineEdit", "styles", "focus"],
	["LineEdit", "styles", "read_only"],
	["LineEdit", "colors", "font_color"],
	["LineEdit", "colors", "font_placeholder_color"],
	["LineEdit", "colors", "caret_color"],
	["LineEdit", "colors", "selection_color"],
	["LineEdit", "font_sizes", "font_size"],
	["TextEdit", "styles", "normal"],
	["TextEdit", "styles", "focus"],
	["TextEdit", "styles", "read_only"],
	["TextEdit", "colors", "font_color"],
	["TextEdit", "colors", "font_placeholder_color"],
	["TextEdit", "colors", "caret_color"],
	["TextEdit", "colors", "selection_color"],
	["TextEdit", "font_sizes", "font_size"],
	["LineEdit", "colors", "font_uneditable_color"],
	["TextEdit", "colors", "font_readonly_color"],
	["LineEdit", "constants", "caret_width"],
	["HSeparator", "styles", "separator"],
	["HSeparator", "constants", "separation"],
	["TooltipPanel", "styles", "panel"],
	["TooltipLabel", "colors", "font_color"],
	["TooltipLabel", "font_sizes", "font_size"],
	["ItemList", "styles", "panel"],
	["ItemList", "styles", "focus"],
	["ItemList", "styles", "hovered"],
	["ItemList", "styles", "selected"],
	["ItemList", "styles", "selected_focus"],
	["ItemList", "styles", "hovered_selected"],
	["ItemList", "styles", "hovered_selected_focus"],
	["ItemList", "colors", "font_color"],
	["ItemList", "colors", "font_hovered_color"],
	["ItemList", "colors", "font_selected_color"],
	["ItemList", "colors", "font_hovered_selected_color"],
	["ItemList", "font_sizes", "font_size"],
]
const VARIATIONS := [
	["ButtonSquare", "Button"],
	["ButtonClose", "Button"],
	["SlotButton", "Button"],
	["LabelMuted", "Label"],
	["LabelTitle", "Label"],
	["LabelOnAccent", "Label"],
	["LabelOnDark", "Label"],
	["LabelTooltip", "Label"],
	["LabelWell", "Label"],
	["PanelInset", "PanelContainer"],
	["WindowPanel", "PanelContainer"],
	["DialogBox", "PanelContainer"],
	["NamePlate", "PanelContainer"],
	["TooltipBox", "PanelContainer"],
	["Ribbon", "PanelContainer"],
	["CurrencyPlate", "PanelContainer"],
	["QuestEntry", "PanelContainer"],
	["ListRow", "PanelContainer"],
	["Slot", "PanelContainer"],
	["SlotHover", "PanelContainer"],
	["SlotSelected", "PanelContainer"],
	["SlotRare", "PanelContainer"],
	["SlotEpic", "PanelContainer"],
	["HotbarSlot", "PanelContainer"],
	["PortraitFrame", "PanelContainer"],
	["ProgressBarMana", "ProgressBar"],
]

var _bad: Array[String] = []


func _check(ok: bool, what: String) -> void:
	if not ok:
		_bad.append(what)


func _has(theme: Theme, type: String, kind: String, item: String) -> bool:
	match kind:
		"styles":
			return theme.has_stylebox(item, type)
		"icons":
			return theme.has_icon(item, type)
		"colors":
			return theme.has_color(item, type)
		"constants":
			return theme.has_constant(item, type)
		"font_sizes":
			return theme.has_font_size(item, type)
	return false


func _count_pngs(path: String) -> int:
	var count := 0
	for dir_name in DirAccess.get_directories_at(path):
		count += _count_pngs(path.path_join(dir_name))
	for file_name in DirAccess.get_files_at(path):
		if file_name.ends_with(".png"):
			var texture := load(path.path_join(file_name)) as Texture2D
			_check(texture != null and texture.get_width() > 0, path.path_join(file_name) + ": did not load")
			count += 1
	return count


func _initialize() -> void:
	var boxes := 0
	var icons := 0
	var items := 0
	for index in THEMES.size():
		var file: String = THEMES[index]
		var scale := index + 1
		var theme := load(ADDON + file) as Theme
		_check(theme != null, file + ": did not load as a Theme")
		if theme == null:
			continue
		_check(theme.default_font != null and theme.default_font_size > 0, file + ": default font")
		for entry: Array in ITEMS:
			if _has(theme, entry[0], entry[1], entry[2]):
				items += 1
			else:
				_bad.append("%s: missing %s/%s/%s" % [file, entry[0], entry[1], entry[2]])
		for variation: Array in VARIATIONS:
			_check(theme.get_type_variation_base(variation[0]) == StringName(variation[1]), "%s: %s should be a variation of %s" % [file, variation[0], variation[1]])
		for type in theme.get_stylebox_type_list():
			for item in theme.get_stylebox_list(type):
				var box := theme.get_stylebox(item, type)
				_check(box != null, "%s: %s/%s is null" % [file, type, item])
				var textured := box as StyleBoxTexture
				if textured == null:
					continue
				boxes += 1
				var texture := textured.texture
				_check(texture != null, "%s: %s/%s has no texture" % [file, type, item])
				if texture == null:
					continue
				_check(("/%dx/" % scale) in texture.resource_path, "%s: %s/%s uses %s" % [file, type, item, texture.resource_path])
				var across := textured.get_texture_margin(SIDE_LEFT) + textured.get_texture_margin(SIDE_RIGHT)
				var down := textured.get_texture_margin(SIDE_TOP) + textured.get_texture_margin(SIDE_BOTTOM)
				_check(across <= texture.get_width() and down <= texture.get_height(), "%s: %s/%s 9-slice margins are larger than the texture" % [file, type, item])
		for type in theme.get_icon_type_list():
			for item in theme.get_icon_list(type):
				_check(theme.get_icon(item, type) != null, "%s: icon %s/%s is null" % [file, type, item])
				icons += 1

	var pngs := _count_pngs(ADDON + "textures")
	_check(pngs == TEXTURES, "expected %d PNGs, found %d" % [TEXTURES, pngs])

	# The demo scene: every Control gets laid out with the theme; then use the widgets.
	var demo: Control = (load(ADDON + DEMO) as PackedScene).instantiate()
	root.add_child(demo)
	for frame_index in 3:
		await process_frame
	_check(demo.theme != null and demo.theme.resource_path == ADDON + THEMES[0], "demo should use the 1x theme")
	var controls := demo.find_children("*", "Control", true, false)
	var empty_rects := 0
	for control: Control in controls:
		if control is TextureRect and (control as TextureRect).texture == null:
			empty_rects += 1
	_check(empty_rects == 0, "%d TextureRects without a texture" % empty_rects)
	var used := 0
	for control: Control in controls:
		if control is Range and not (control is ScrollBar):
			(control as Range).value = (control as Range).max_value * 0.25
			used += 1
		elif control is BaseButton and not (control as BaseButton).disabled:
			var button := control as BaseButton
			if button.toggle_mode:
				button.button_pressed = not button.button_pressed
			button.pressed.emit()
			used += 1
		elif control is LineEdit:
			(control as LineEdit).text = "Test"
			used += 1
	for frame_index in 3:
		await process_frame
	_check(demo.has_method("self_check"), "demo has no self_check()")
	if demo.has_method("self_check"):
		var problem: String = demo.self_check()
		_check(problem.is_empty(), "demo self_check: " + problem)

	print("RESULT themes=%d theme_items_checked=%d texture_styleboxes=%d theme_icons=%d pngs_loaded=%d demo_controls=%d demo_controls_used=%d bad=%s" % [
		THEMES.size(), items, boxes, icons, pngs, controls.size(), used, str(_bad)])
	quit(0 if _bad.is_empty() else 1)
