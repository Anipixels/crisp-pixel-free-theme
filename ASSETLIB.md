# Asset Library submission - Crisp Pixel Free Theme

Paste these into https://godotengine.org/asset-library/asset/submit (log in first). Nothing has been submitted or pushed yet.
The repository URL assumes the GitHub account is `Anipixels` and the repository is named as suggested; adjust if not.

| Field | Value |
|---|---|
| Asset Name (title) | Crisp Pixel Free - Pixel Art RPG UI Theme |
| Category | Misc |
| Godot version | 4.3 (tested only on 4.7.2 stable (the .NET editor build, run headless on Windows 11); see the note below) |
| Version | 1.0.0 |
| Repository host | GitHub |
| Repository URL | https://github.com/Anipixels/crisp-pixel-free-theme |
| Issues URL | https://github.com/Anipixels/crisp-pixel-free-theme/issues |
| Download Commit | the full 40-character hash of the commit you pushed (`git rev-parse HEAD`) |
| Icon URL | https://raw.githubusercontent.com/Anipixels/crisp-pixel-free-theme/main/icon.png |
| License | CC-BY-4.0 (the form takes one licence; the description says the GDScript is MIT) |
| Suggested repo name | crisp-pixel-free-theme |

Preview: type **Image**, image URL and thumbnail URL both
`https://raw.githubusercontent.com/Anipixels/crisp-pixel-free-theme/main/screenshot.png`

## Short description

(For the GitHub repository "About" line; the Asset Library form has no short-description field.)

A free pixel-art fantasy RPG UI Theme (Oak & Brass) with 53 pieces at 1x-4x: buttons, panels, window, inventory slots, health and mana bars, dialogue box, check box, slider, 18 icons.

## Description (long)

```
A pixel-art fantasy RPG UI Theme (Oak & Brass: walnut frames, brass corners, tan boards), with the pixel-art pieces it is built from.

Set res://addons/crisp_pixel_free/crisp_pixel_free.tres as your project theme (or on any Control) and these are styled:
- Button (normal, hover, pressed, disabled), OptionButton, CheckBox, ProgressBar (health), HSlider, LineEdit, TextEdit, Panel,
  PanelContainer, HSeparator, ItemList, tooltips, Label.
- Type variations: ButtonSquare, ButtonClose, SlotButton (clickable inventory slot), ProgressBarMana, Slot / SlotHover / SlotSelected /
  SlotRare / SlotEpic, HotbarSlot, WindowPanel, DialogBox, NamePlate, PanelInset, Ribbon, CurrencyPlate, QuestEntry, ListRow, TooltipBox,
  PortraitFrame, LabelTitle, LabelOnAccent, LabelWell, LabelTooltip, LabelOnDark, LabelMuted.
- One Theme per scale: 1x (for a 320 x 180 to 480 x 270 viewport with integer scaling), 2x, 3x and 4x (for full-resolution UIs).

Also included: 53 pieces at 1x, 2x, 3x and 4x (212 PNGs) - 35 Oak & Brass pieces, 18 colour icons at 16 x 16 (sword, shield, potion,
key, chest...) and a mouse cursor - and a demo scene: addons/crisp_pixel_free/demo/pixel_free_demo.tscn
True pixel art: no anti-aliasing, whole-number scales only; use nearest texture filtering (the demo sets it on its root).

Not covered, because the free sampler has no pieces for them: switch (CheckButton) art, radio buttons, tabs, scroll bars, popup menus,
vertical sliders. No font is bundled (the two pixel fonts are in the full pack). Installs into addons/crisp_pixel_free.
Written for Godot 4.3+, tested on 4.7.2.

This is the free sampler of Crisp Pixel, which has 139 pieces in each of 6 themes, 157 icons, two pixel fonts and a full Godot theme per
theme and scale: https://anipixels.itch.io/crisp-pixel
Or get every Crisp pack in one bundle: https://itch.io/s/203391/crisp-everything-bundle

Licence: images, Theme and scene files CC BY 4.0 (credit "Crisp Pixel Free Theme by Anipixels" with the link above); GDScript MIT.
How it was made: every pixel is placed procedurally by code written with an AI assistant (Claude). No AI image generators.
```

## Notes before you submit

- Godot version: the addon is written for 4.3+, but it has only been run on 4.7.2. Choosing "4.3" in the form is a claim that
  it works there. If you would rather claim only what was tested, pick the newest 4.x entry the form offers instead.
- The `.gitattributes` file marks everything except `addons/` as `export-ignore`, so the zip the Asset Library downloads
  contains only `addons/crisp_pixel_free/` (with its own README and licence copy).
