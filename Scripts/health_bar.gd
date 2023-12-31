extends ProgressBar

var stylebox_1: StyleBoxFlat = StyleBoxFlat.new()
var stylebox_fill: StyleBoxFlat = StyleBoxFlat.new()
var prev_fill: float = 0

func _ready() -> void:
	stylebox_1.set_border_width_all(2)
	stylebox_1.border_color = Color.BLACK
	stylebox_1.set_corner_radius_all(8)
	stylebox_fill.set_border_width_all(2)
	stylebox_fill.border_width_right = 0
	stylebox_fill.border_color = Color.BLACK
	stylebox_fill.set_corner_radius_all(8)
	stylebox_fill.corner_radius_top_right = 0
	stylebox_fill.corner_radius_bottom_right = 0
	stylebox_fill.bg_color = Color.GREEN
	stylebox_1.bg_color = Color.GREEN
	value_changed.connect(change_stylebox)

func change_stylebox(fill: float):
	if prev_fill != 1 and fill == 1:
		remove_theme_stylebox_override("fill")
		add_theme_stylebox_override("fill", stylebox_1)
	elif fill != 1 and prev_fill == 1:
		remove_theme_stylebox_override("fill")
		add_theme_stylebox_override("fill", stylebox_fill)
	prev_fill = fill
