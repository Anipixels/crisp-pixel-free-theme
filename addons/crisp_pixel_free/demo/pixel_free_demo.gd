extends Control
## Crisp Pixel Free demo: a small pixel-art RPG screen made of plain Godot controls styled by the Theme.
## The slider drives the mana bar and the Equip button heals the hero a little.
## The scene is laid out for a 480 x 270 viewport, shown at a whole-number scale with nearest filtering.

@onready var _slider: HSlider = %ManaSlider
@onready var _mana: ProgressBar = %Mana
@onready var _health: ProgressBar = %Health
@onready var _equip: Button = %EquipButton


func _ready() -> void:
	_slider.value_changed.connect(_on_slider_changed)
	_equip.pressed.connect(_on_equip_pressed)
	_on_slider_changed(_slider.value)


func _on_slider_changed(value: float) -> void:
	_mana.value = value


func _on_equip_pressed() -> void:
	_health.value = 20.0 if _health.value >= _health.max_value else minf(_health.value + 10.0, _health.max_value)


## Used by tests/test_addon.gd: returns an empty string when the demo wiring works.
func self_check() -> String:
	if not is_equal_approx(_mana.value, _slider.value):
		return "mana bar does not follow the slider"
	if texture_filter != CanvasItem.TEXTURE_FILTER_NEAREST:
		return "the demo root should use nearest filtering"
	# Fixed-height art (no top or bottom 9-slice border) must not be stretched up or down: pixel art would smear.
	for panel: Control in find_children("*", "PanelContainer", true, false):
		var box := panel.get_theme_stylebox(&"panel") as StyleBoxTexture
		if box == null or box.texture == null or box.texture_margin_top > 0.0 or box.texture_margin_bottom > 0.0:
			continue
		if not is_equal_approx(panel.size.y, box.texture.get_height()):
			return "%s is %d px high, but its fixed-height art is %d px" % [panel.name, panel.size.y, box.texture.get_height()]
	return ""
